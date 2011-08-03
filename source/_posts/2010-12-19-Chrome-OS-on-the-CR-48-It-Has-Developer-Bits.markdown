---
title: "Chrome OS on the CR-48: It Has Developer Bits!"
layout: post
category: programming
image: "/images/post_icons/chrome_logo.png"
image_alt: "Delicious crunchy bits, like bacon which has been slightly burned."
published: true
---
So for anyone out there who is not already insanely jealous of my good looks and/or impeccable fashion sense, you should know I was one of the recipients of a CR-48 netbook in Google's free giveaway.

A full review is forthcoming (sneak preview: it is awesome), but here I just wanted to share a couple quick things I found that turn ChromeOS from an interesting toy to a usable developer's tool.

## tl;dr
* Process Manager/Task Manager: Shift-Esc
* Shell/SSH Client: Ctrl-Alt-t
* Developer Tools: Ctrl-Shift-i

<!-- read more -->

## Process Manager/Task Manager:

While using Chrome on Ubuntu, I learned that pressing "Shift-Esc" would bring up a Chrome-specific task manager, displaying memory and CPU usage, and making a few other interesting stats available.  

Once I got my hands on the CR-48, I quickly started to swamp it with flash, banner ads, and JS-heavy front-ends (GMail, I'm looking at *you*).  Sure enough, "Shift-Esc" popped up my process list, allowing me to evaluate and kill chunky processes.

## Shell and SSH client:

For development work, I can skate by with nothing more than a browser and an SSH client.  Since ChromeOS is billed as a browser-only OS, I figured I was out of luck.  I started hunting around for browser-based SSH clients, but most of them require you to either install special software on your server (not really workable if I want to connect on an ad-hoc basis) or trust your SSH logins and/or keys to some web service (which I will consent to shortly after Hades develops a nice thick layer of permafrost).

Fortunately, Google had the foresight to build a shell into ChromeOS.  Press "Ctrl-Alt-t" to pop open a new terminal.  The shell is called "crosh" (short for "Chrome OS Shell", I suspect)  It's not going to replace bash anytime soon; its functionality appears to be limited mostly to diagnostics and network configuration.  

It does provide an SSH client, which feels snappy and appears to work well.  Some of the Unicode characters in the shell come across a bit garbled (a side effect of a fancy shell prompt on my dev box), but that's the only complaint I've had so far.

You can open multiple terminals, and you can switch between them (and your open browser windows) with Alt-Tab (or the built in window switcher button).

## Developer Tools: DOM Inspector, Javascript Console, etc.:

If you've been using Chrome for development, you're probably already familiar with the developer tools (which are rapidly replacing Firebug as my favorite browser tool).  "Ctrl-Shift-i" pops up the tool dock (which can then be shunted out to its own separate window if you need to dig around in there for a while).  Right-clicking a screen element and selecting "Inspect element" still works exactly as expected.  "Ctrl-Shift-i" a second time makes the inspector go away.

These features, combined with the wi-fi and 3g, make the CR-48 a very usable mobile development platform.  It's not going to replace a meaty devbox with a ton of RAM and three monitors, but for some on-the-go coding, I'm surprised and pleased with just how capable it really is.

