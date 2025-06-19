---
title: Choose your tools wisely
description: Story about necessary changes
date: "2025-06-19 21:30:04.000 +0200"
draft: true
---

Have you ever been affected by sudden change of your software of choose? Say, they ask for more money for your subscription, or the license has changed to what got unacceptable to you. Or, its UI got rewritten so much you no longer recognized it? Yeah, we all did. This article is about how to avoid that.

## I miss boxes

I remember "good old days" when software boxes where actual boxes. Not image of a box next to the price (I am looking at you FL Studio!). 

The real cardbox with it all! Such box contained instructions, CD-ROM and/or floppy disc inside. And the license was perpetual, meaning it wasn't expired after some time. And it shurely couldn't have changed. Obviously, that would come with a few caveats such as bugs were there forever or at least until you get some patches or some sort of service pack.

You could have bought and used Photoshop 6 (no, not CS) for next 20 years for around $299 per license key. And what you got could stand on the shelf as a decoration. It wasn't JUST a digital product back then.

Later on cardboard boxes were replaced with plastic ones, especially on gaming market. These are the ones we know nowadays. The difference is these days there's non-zero chance that the box contains license key to Steam only...

## SaaS

After a big success of Netflix and then Spotify, software as a service model got to the mainstream and became extremely popular. The model is indeed genius. You offer a service and if someone's willing to use it they have to pay. For every month of its use. There have been some ridiculous situations like when Autodesk became charging for their (back then) new subscription based products more than for perpetual license back in the day.

To be fair, one of the reasons these companies attempted to shift towards monthly billing was also the fact they were pirated a lot. Instead of fighting with distribution model of their binaries, they would simply lock the running software if the computer had no access to the internet to confirm eligibility of the license.

Another reason was agile software methodologies that became a thing. Agile increment delivery was aligned with SaaS so well that the product was treated as buggy mess that will be fixed when priorities will let it be fixed.

# Education

Sad part about license revolution is that universities play big role in promoting these kind of companies. What I mean by that is, these companies offer free licenses for students. University then decides to run a class on it and legitimizes it in the eyes of students who do not know any better.
In consequence employees look for people who know said program as they tend to be a majority of the market, or worse, said students demand a software they're proficient at which puts more expense on the employer. There are exceptions of the rule (blender I am looking at you!) but rare ones.

## Easy to fix; easy to break

Saas are flourishing. Developers of them have also easy time to fix bugs and issues. However, they tend to more than that. Like introducing new features, redesigning the UI, breaking some old "unneeded" stuff. Finally, making their product unusable to people who knew it. You just have to adapt to changes, learn new tricks. Over and over and over again...

Good example is Visual Studio. Microsoft was improving it every 4-5 years. But it was also completely different software after each iteration. That meant it expected different format of csproj files. Different versions of cpp. Different components. You might have 2017, 2019 and 2022 installed all at once. All these would separate things they rely on... It was a big mess charged $2000 annually. Most people hate it because its large and clunky. I hate it because installing process was such a pain.

## I was done

I told myself that I can no longer work on proprietary software. I was tired of rug pulls like discontinuations, changes of licenses, price increases and changes to adapt every 3 years. Fighting mentally on all that, I found out about Linux.

One day I checked PayPal and it had neat feature, a summary how much do I pay to each vendor annually. I seen Spotify and my jaw dropped. I decided. I got rid of every subscription I had. Netflix - gone. I do not watch that much anyway. Spotify - gone, I just started buying albums on concerts, got myself mp4 player too.

For DAW I choose Reaper for its simplicity and conservative changes to UI and feature set. I like to get back to it after a year or two and still know where I am. Although there's open source alternative called Ardour I had a few issues with it still. Maybe some day.

## Stability by forkability

Then I realized something. The lowest retention of knowledge happens to open source software. And I do not want to re-learn things every 5 years.

1. There are rarely any license changes. And if there are there's big backlash i.e. redis/valkey situation or qt 6.
1. Usually backwards compatibility plays a large role during a release
1. You can use old version potentially forever
1. User documentation tends to be better than proprietary software
1. Community tends to be large and helpful!
1. You can compile it and understand its code if you want
1. Software changes when there are feature requests or bugs to fix. 

Not to say OSS is not changing, sometimes it dramatically does. But generally its user focused. And you still can use some old version you liked forever. Generally OSS focuses on technology and improves. Companies focus on marketing. New thing for new reason is 'fresh' and 'interesting'.

## Development approach shift

Since I was talking about Visual Studio you probably figured I was C# developer. I was indeed. And I was so frustrated of the fact I lived through ASP.NET Core revolution. In short, Microsoft decided to leave .NET 4.7 and start over. After 3 versions of .NET Core that worked on Linux, they did another project to reintegrate these changes to original .NET naming convention and call them .NET 5. These were 2 large revolutions in the language in 4 years. I started questioning whether I want to learn new stuff every 3 years for the sake of it.

After I switched to Linux on my personal PC being feed up with Windows 8 (and then 10 too at work) I worked on Jetbrains' Rider on a C# job I had so I could run things on both systems. In the meantime I was looking for the way to get out of the place I got myself into. 

I found myself in pure JS projects for a while and I loved the fact I didn't had to do anything fancy. Just FLOSS neovim, docker, terminal and node.js. Obviously, over time I got myself into framework war (company used mostly Angular, I did React) and JavaScript wasn't that fullfilling to me to spend a carreer in but, I decided to never look back on Microsoft.

My demands for a new language were simple: 
- works on linux, 
- slow change/no change, 
- build static ELF executable, 
- be open source friendly. 

The obvious candidate was C but I was not ready for 'undefined behavior' part of the language. Maybe some day I'll pick up on it for POSIX development on some old standard like IEC 8898, just for fun. I started soft, with Golang and loved it since! Mainly for its well written documentation, making it easy to see library and even stdlib code. I have never seen such a seamless environment. Proudly work on Golang for alost 3 years at this point. I do pick up on zig too and its great for my small projects I am doing off hours!

Next to programming languages I learned bash as well. The awesome part about it, you might use it in 15 years from now like nothing changed. I feel like this is time well put into a skill that will serve me for years to come.

## Exceptions of the rules

Over the years I trusted JetBrains software for the fact they allow for perpetual license keys. I believe they call it fallback license. You can use your version of CLion or whatnot from 2013 if you really want! As long as you paid for at least a full year. 

Also Reaper, a DAW software. I remember using it back in 2013 and its look and feel is still very similar.

## Conclusion

Sanitize your tech stack. Choose software wisely. Learn bash for small automations.
