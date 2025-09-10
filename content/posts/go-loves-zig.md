---
title: Go loves zig!
date: "2025-08-25 05:27:01 +0200"
draft: false
---

You might not work with `cgo` and C interoperability of Go programming language, but I find it extremely fascinating. Zig's build system is dark magic, that solves all the issues I had with gcc. This article is not really anything new but you might find it interesting.

<!--more-->

## Introduction to CGO

CGO is niche part of golang programming language. Its main goal is to support language bindings for C and import relevant header files that are required to build the project. 

How it works by default is you set a special flag, provide a header file to compile (or a go package having c bindings within) and 
- CGO_ENABLED=1 just makes these dynamically link together during compilation. You need these libs installed so program can start.
- CGO_ENABLED=0 is the opposite. You statically link the program. However it still is compiled only for your system. And it won't accept any C bindings.

I have been using `CGO_ENABLED=1` along with `raylib` or `sqlite` to do fun stuff. Its not ideal though.

What if it can be cross platform?...

## Example project

We will be using following git repo `https://github.com/smoorg/ComputerTracker` for testing purposes. Its simple API with sqlite dependency. 

Here's how to build it:

```shell
$ CGO_ENABLED=0 go build -o nocgo main.go

$ file nocgo
cgo: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, ...

$ du -h nocgo
14M	nocgo
```

What did it do? It dynamically linked the executable along with your system's libc, in my case Linux one.

```shell
$ CGO_ENABLED=1 go build -o cgo main.go

$ file cgo
cgo: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, ...

$ du -h cgo
17M	cgo
```
 
We can confirm that CGO_ENABLED=1 is dynamically linked:

```shell
$ ldd cgo
	linux-vdso.so.1 (0x00007fe254abd000)
	libresolv.so.2 => /usr/lib/libresolv.so.2 (0x00007fe254a7f000)
	libc.so.6 => /usr/lib/libc.so.6 (0x00007fe254800000)
	/lib64/ld-linux-x86-64.so.2 => /usr/lib64/ld-linux-x86-64.so.2 (0x00007fe254abf000)

```

I was surprised it was larger than CGO_ENABLED=0. But it didn't worked after all so I guess sqlite bindings did not compile with CGO_ENABLED=0 approach. As we can see CGO_ENABLED=1 did dynamically linked `libc` and couple other packages to it. No sqlite though which indicates that it was included into a binary along with its bindings.

Let's test how both behave:

## CGO off

```shell
$ docker build -f Dockerfile-nocgo . -t nocgo
$ docker run -it -p 9001:9001 -it nocgo:latest
```

Then, I called `curl https://localhost:9001/computers` in separated terminal and got this:

```shell
2025/08/25 04:13:49 Binary was compiled with 'CGO_ENABLED=0', go-sqlite3 requires cgo to work. This is a stub
```

Our program wont complain during compilation, it does however during runtime. That is not ideal but at least the message is explicit enough.

## CGO on

```shell
$ docker build -f Dockerfile . -t cgo
$ docker run -it -p 9001:9001 -it cgo:latest
```

Results were fine. The project works. However, its dynamically linked. We can do better than that.

## Ziggified go!

What we learned from this article so far is that go compilation process is, well, iffy. For once statically linked stuff can fail on runtime. Dynamically linked CGO_ENABLE=1 however works but only on certain system. How can we mitigate it? Replace C compiler with zig!

```shell
$ CC="zig cc -target x86_64-linux" CGO_ENABLED=1 go build -o zigged
```

Results:
```sh
$ ldd zigged
	not a dynamic executable

$ du -h zigged
31M	zigged

$ file zigged
zigged: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked ...
$
```

Binary results proper curl responses as it should. I am quite happy with it.

## Conclusion

Zig used as a compiler has mitigated all the issues I happened to have with go, it skipped dependency on libc and now you can build to any target from linux. One drawback was the executable got significantly larger at the end, but that was expected since it got rid of entire libc dynamic link. 

I am quite happy with the result. However, you do want to be REALLY carefull before using any GPL licensed software with such method. Most free software licenses prohibit from statically compile their stuff unless you use GPL license to your software too. 

Fortunately licenses like MIT and public domain software has no such limitations.

