---
title: Hidden Chrome Features on CR-48
layout: post
category: programming
published: true
---

After having playing around with ChromeOS on the CR-48 netbook ([which I've blogged about before](http://calamitylane.com/articles/programming/chrome-os-on-the-cr-48-it-has-developer-bits)), I've found a few more interesting tidbits that let you dig deeper into the system.

## tl;dr
* Experimental Features/Flash Drives: chrome://flags
* Nicer View of Memory Usage: about:memory
* Hilarious Pranks: about:crash
* Wi-Fi Troubleshooting: about:network
* Manage Extensions and Apps: chrome://extensions

--- break here ---

## Experimental Features/Flash Drives:

If you've tried to hook a flash drive up to your CR-48, you may have been disappointed to discover that the CR-48 doesn't yet support this.  

Going to the address **chrome://flags** opens up a few options for you.  The page clearly states that these are experimental and possibly harmful, but there is an option to enable the "Advanced File System," which includes USB and SD support.

There are a few other features to play with: a built-in media player, remoting, background apps and so forth.  Definitely some good stuff to poke at in there.

## Nicer View of Memory Usage:

In [my last post](http://calamitylane.com/articles/programming/chrome-os-on-the-cr-48-it-has-developer-bits) I showed how "Shift-Esc" pops up a process viewer, which could be used to keep an eye on any misbehaving pages.  This is nice, but the window is tiny, and if you tend to have 40 or 50 tabs open at any given time, it can be burdensome to scroll through the list.

Going to **about:memory** will give you a nice, full-page list of all your process' memory consumption.  This list is not sortable, but if you're looking for a specific process, you can use the Chrome's find-in-page function, since the memory usage displays as a regualar web page.

## Hilarious Pranks:

Putting **about:crash** in the address bar shows Chrome's "sad folder" crash page.

Something about this makes me want to quietly set about:crash as someone's homepage.  Probably because I am a terrible, terrible person.

## Wi-Fi Troubleshooting:

Looking at **about:network** will show you a list of all available wi-fi and 3G connections (along with signal strength and other typical wi-fi info), and a list of "remembered" connections.

If you're playing with router settings or testing things, you can set this view to automatically refresh by appending a number of seconds to the address.  For example, pointing your browser to **about:network/3** will cause the page to refresh every 3 seconds.  This is handy if you're looking for a good spot to set up; you can keep an eye on signal strengths as you move around.

## Manage Extensions and Apps:

You've probably seen this one if you're used to using Chrome on other OSes, but for some reason, on ChromeOS this doesn't show up on the menu.  Going to **chrome://extensions** will show you a list of all your installed extensions and apps.  You can disable or uninstall them from here.

Additionally, you can get to the "Developer Mode" options, which is handy if you're writing a Chrome extension.  You can install a local extension, package it up, or force it to reload.

I used this extensively while writing my [Mustard Gas](https://chrome.google.com/webstore/detail/mbaomoafgihhkhgmkkoealeopilfdeaf#) extension.

If you want to get into Chrome extension development, You can start [here](http://code.google.com/chrome/extensions/getstarted.html) or begin with Google's [FAQs](http://code.google.com/chrome/extensions/faq.html).  Chrome extensions are just HTML5 and Javascript, so if you've been doing any web development, you already know 90% of what you need to write Chrome extensions.

