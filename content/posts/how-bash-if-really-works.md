---
title: How bash 'if' really works?
description: Article describes if statement behavior and GNU test lib
date: 2022-04-20 00:00:01.224 +0100
publish: draft
---

You probably never think of it but behind every bash script stands tons of if-else statements which are responsible for whole script logic, as error gates or even correctness of operations. What if I told you that bash shell does not really interpret if statements itself? A test library serves that purpose and this is what this article is really about.

## test library

Testing library usually located at `/usr/bin/test` is a GNU util which is responsible for comparing expressions and values against each other. The result of the comparison is an `exit code` of `0` or `1`, depending whether the operation was successful. Here is an example that demonstrates that behavior:

```sh
$ test 3 -gt 2 ; echo $?
0
$ test 1 -gt 2 ; echo $?
1
```

Let's describe what is happening in that simple test in details. 

1. `test` library gets called with three arguments:
	- first expression
	- type of comparison (there `-gt` which means `greater than`)
	- second expression
1. Semicolon says we want to wait for the last operation to end.
1. `echo $?` checks the status code of the previous operation. `0` means that it was successful and no errors occurred.

## But you need square braces in if statements, no?

Bash serves multiple ways to write if statements, one of them is calling them using `if` keyword and square braces, like so:

```sh
if [ -n "$VARIABLE" ]; then
	echo 'variable exists'
fi
```

What actually happens behind the curtain is something like this:

```sh
[ -n "$VARIABLE" ] && echo 'variable exists'
```

Which means pretty much the same as:

```sh
test -n "$VARIABLE" && echo 'variable exists'
```

Quote from the `info test` documentation

> test has an alternate form that uses opening and closing square brackets instead a leading ‘test’. For example, instead of ‘test -d /’, you can write ‘[ -d / ]’. The square brackets must be separate arguments; for example, ‘[-d /]’ does not have the desired effect. Since ‘test expr’ and ‘[ expr ]’ have the same meaning, only the former form is discussed below. 
>
> Reference: https://www.gnu.org/software/coreutils/manual/html_node/test-invocation.html#test-invocation

## What about other operations?

Many developers has troubles to figure out what flags are actually supported. __Use provided manuals__. I can't think of how often it saved my ass to just look for the flag I need instead of craft something myself. GNU `man` is awesome for that type of a thing along with `info`.

```sh
$ man test
```

That will pop-up full fledged manual for all possible use cases for test library, i.e. join two expressions `test 3 -gt 2 -a 3 -gt 1` thanks to `-a` flag.

## Conclusion

I really encourage you to check what else `test` can do in your bash scripts and try to use it in various ways as much as possible, it's single the most useful library you'll ever use in that field. The more standard and well tested your tools are, the safer your scripts will be!
