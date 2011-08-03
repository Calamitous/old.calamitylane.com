---
title: "Them what deals with th'Devil..."
layout: post
category: programming
published: true
---
With my recent spate of GServer problems, I thought I'd post something that, surprisingly, turned out not to be much of a problem at all: turning a Ruby GServer into a Windows service.

<!-- read more -->

First, it helps tremendously if you already have Cygwin installed.  If you don't, you should, as you get lots of UNIX-y command-line goodness (for example, a "Find In Files" functionality (grep) that actually finds stuff in files.  Uncanny!)

I'd used Cygwin's "cygrunsrv" to run Cygwin's SSH server on Windows, because I love SSH and it seemed like a good idea at the time.  I didn't realize you could use it to create service out of arbitrary programs.  With the following command (broken up for readability):

    cygrunsrv /
        --install "Bill Gates is Reading My Source Code Service" /
        --path c:/ruby/bin/rubyw.exe /
        --args c:/Projects/source_viewer/source_viewer_server.rb


...you can be running your server under your very own Windows service!  (Pardon me while I run gargle with some bleach.)

Basically, you just need a name, the path to your Ruby executable, and the path to your application, and you're good to go.  

Notice here that I've used "rubyw.exe" which is a "windowless" version of Ruby.  It does not try to open Window's crippled console, but runs strictly in the background, which is nice if you want to launch a server from a windows shortcut without distracting little black screens popping up.  I have no idea if this helps any, but I figured it couldn't hurt (famous last words).

One other important thing to be aware of is that Windows does not respond to standard system signals, so you will need to add the following method to your server class ([as seen here](http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/109133)):

<div class="ruby"><pre style="overflow: hidden;"><code class="line_number" style="float: left; margin-right: 1em">1
2
3
4</code><code><span class="keyword">def </span><span class="method">trap</span><span class="punct">(</span><span class="ident">signal</span><span class="punct">)</span>
&nbsp;&nbsp;<span class="constant">Kernel</span><span class="punct">::</span><span class="ident">trap</span><span class="punct">(</span><span class="ident">signal</span><span class="punct">){</span><span class="keyword">yield</span><span class="punct">}</span> 
&nbsp;&nbsp;<span class="constant">Thread</span><span class="punct">.</span><span class="ident">new</span><span class="punct">{</span><span class="ident">loop</span><span class="punct">{</span><span class="ident">sleep</span> <span class="number">1</span><span class="punct">}}</span> <span class="comment"># Stupid Windows...</span>
<span class="keyword">end</span></code></pre></div>

This lets you stop the service from services.msc-- if you don't have this, chances are good that the whole thing will hang when you try to stop or restart your service.

There are a number of other (probably better) methods to turn programs into Windows services, but this one was quick, easy and served my needs well.

