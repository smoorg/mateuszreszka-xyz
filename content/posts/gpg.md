---
title: Encrypt your e-mails! It's simpler than it looks.
date: 2023-03-18 17:23:43.000 +0100
draft: false
---

For past few years my default communication tool was matrix protocol created by matrix.org. It's great but let's be real, its not for everybody. Then, what can you expect your friends surely have? An e-mail account! The tricky part is, its old protocol with no data encryption by default. I will try to describe my latest journey with GPG, an OpenPGP standarized tool for encrypt and manage encryption keys.

## How to start?

First, you need to understand the concept of gpg keys. A gpg key consists of private and public key. First one is only for you, former is to share with others wherever you can, usually on so called key servers. To properly encrypt e-mails with your peer you need to do few steps, which might not be that intuitive at start. After all, `man gpg` is huge and doesn't explain every usecase you might have.

First you need a key

```sh
gpg --gen-key
```

After that command you will be asked for few questions regarding the key, like your name, email, comments and so on and you're good to go. You can see your key by checking your key list

```sh
gpg --list-keys
```

## E-mail encryption 

Alright, we have gpg key set up. Here we will discuss the steps to start encrypting the messages between you and your receipents.

1. You want to send your signature to your peer. You can sign your e-mail or any document with your gpg key `gpg --sign [filename]`. In `neomutt` mail client you can do that before send the message by click `p` and then `s` to sign.

2. You want also to send your public key to popular keyservers or host it yourself on your webpage if you have any. 
	Few examples:
	
	- keyserver.ubuntu.com
	- keyserver.pgp.com
	- pgp.mit.edu
	
	```sh
	gpg --keyserver keyserver.pgp.com \
        --send-keys [your_email_or_keyid]
	```
	
	In case you'd like to send it along with the message you have to save it as file and attach to the e-mail
	
	```sh
	gpg --armor \
        --output public_key.gpg \
        --export [your_email_or_keyid]
	```

3. Skip that part if you send public_key to your peer. 

	If your peer will receive your e-mail along with a signature but not with public key, it will be necessary to download your public key for himself in order to encrypt future messages. They can use `gpg --receive-key [your_email_or_keyid]` to find your key in default keyserver like `keyserver.ubuntu.com`. If they'd like to look in different servers `--keyserver` option can be added.

	```sh
	gpg --keyserver keyserver.pgp.com \
        --receive-key [your_peer_email_or_keyid] 
	```
	You can spare him time by sending public key first.

4. Once you share your keys you can encrypt messages to each-other.
	```sh
	gpg --encrypt --sign --armor \
        --receipent [your_peer_email_or_keyid] \
        name_of_file
	```
	Neomutt, again is way simpler, `m` to create message, then after it's done you can press `p` and then `e` to encrypt. As long as you have one key saved for your receipent e-mail in gpg store, it should figure things out with no further intervention.
	
	The downside of that operation is, you won't be able to see your own message as only your receipent with their private key are able to decrypt the message. The good side is, you don't leave traces other than your e-mail's title!

## Multi trust layer

Because you can sign not only files but also other keys, it is extra valuable to ask people, who can attest you do use certain gpg key, to sign it and send it back to the keyserver. That proves that at that time it was in fact used by you and it serves as extra validation mechanism for your key.

```sh
gpg --sign your_peer@email.com
gpg --send-keys your_peer@email.com
```

## Further steps
        
You want to create revocation certificate in case of security breach or in case you loose your secret key. Store it somewhere safe!

```sh
gpg --output ~/revocation.crt \
	--gen-revoke [your_email_or_keyid] &&\
	chmod 600 ~/revocation.crt
```

You also want to export your gpg key and save in other machines you're using.

```sh
gpg --export-secret-keys [your_email_or_keyid] 
```

## My key expired what now!

You want your key to expire! The reason is, you can fairly easy refresh it and send back to the servers. It provides extra value to it as it means it is, in fact, used. If you want to switch keys I do recommend create new one, sign it with the old one, and revoke old key, and send them both to the keyserver.

## Summary

I am well aware that this setup might be a little bit long. However, I still believe it's well worth it if you value your security. Besides, in most cases is one time setup for years. You can find my key on `keyserver.ubuntu.com`, `keyserver.pgp.com` as well as [on my page](https://mateuszreszka.xyz/gpg.asc) 
