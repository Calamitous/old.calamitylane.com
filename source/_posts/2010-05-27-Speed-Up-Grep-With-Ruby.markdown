---
title: Speed Up Grep With Ruby
layout: post
category: programming
published: false
---
Anybody who's worked with Linux for any amount of time is familiar with grep:  it's a necessity for any programmer or sysadmin.  It's a powerful and reasonably performant way to search through the contents of your files. 

Unfortunately, "performant" is a relative term-- when you're recursing through an entire Rails project, it's going to take some time, especially if you're working on a large, slighty crufty codebase with a lot of dependencies.

Like any Unixy tool, grep can be chained with other commands.  When you want to trim your search time in a large codebase, the first thing to look at is the "find" command.

 to look at is "-prune -o -path", which removes directories from your search.  For example, if you're trying to find out where you defined a specific method, you don't care to sift through your log files, especially if, like me, you don't regularly run a "rake log:clear".  The following 

You can also limit the sizes of files you want to search to avoid large binaries.  These tweaks provide a significant performance improvement, but then you end up with a command that looks like:

    find ./ -path '*/.svn' -prune -o -path *'/.git' -prune -o -path *'/vendor' -prune -o -path *'/log' -prune -o -path *'/public/yui' -prune -o -path *'/tmp' -prune -o -path *'~' -prune -o \( -size -100000c -type f \) -print0 | xargs -0 grep -ril "i_dont_remember_what_i_was_searching_for"

El yucko.  Fortunately, since we have Ruby handy, we can make this a significantly less stupid process with a tool called [grep-fu](http://github.com/Calamitous/grep-fu/tree/master).

