---
title: Annihilate Ubuntu's Annoying System Beep
layout: post
category: programming
image: "/images/no_beeping.png"
image_alt: "Shhhhh."
published: true
---
A quickie to remind myself next time I build an Ubuntu box, and am being slowly driven batty by a tiny, tinny obsolete PC speaker made of hate:

    sudo gvim /etc/modprobe.d/blacklist

(or /etc/modprobe.d/blacklist.conf, for Ubuntu 9.04)
...and add the following line:

    blacklist pcspkr

From the command line, kill it in the current session:

    sudo rmmod pcspkr

No more waking the baby with late-night hacking sessions!

