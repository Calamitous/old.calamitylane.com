---
title: Annihilate Ubuntu's Annoying System Beep
layout: post
category: programming
published: true
---
<img alt="Shhhhh." class="picA floatleft" src="/images/no_beeping.png">

A quickie to remind myself next time I build an Ubuntu box, and am being slowly driven batty by a tiny, tinny obsolete PC speaker made of hate:

    sudo gvim /etc/modprobe.d/blacklist

(or /etc/modprobe.d/blacklist.conf, for Ubuntu 9.04)
...and add the following line:

    blacklist pcspkr

From the command line, kill it in the current session:

    sudo rmmod pcspkr

No more waking the baby with late-night hacking sessions!

