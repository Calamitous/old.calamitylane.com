---
title: More GServer Goodness
layout: post
category: programming
published: true
---
In a [previous posting](/articles/programming/rails-telnet-server), I demonstrated how to create a telnet server from a Rails application.  After having actually used GServer in anger, I can add a few notes to it:

#### ACCESSING YOUR SERVER REMOTELY

<!-- read more -->

This one took way too long to figure out.  Every example I've seen online ([even the library documentation](http://www.ruby-doc.org/stdlib/libdoc/gserver/rdoc/index.html)) will only let you connect from localhost, which seemed even more exceptionally pointless than the stuff I usually do.  Most of the sample code runs along these lines:

<div class="ruby"><pre style="overflow: hidden;"><code class="line_number" style="float: left; margin-right: 1em">1
2
3
4
5
6
7
8
9</code><code><span class="ident">require</span> <span class="punct">'</span><span class="string">gserver</span><span class="punct">'</span>

<span class="keyword">class </span><span class="class">SomeNewServer</span> <span class="punct">&lt;</span> <span class="constant">GServer</span>
&nbsp;&nbsp;<span class="punct">...</span>
<span class="keyword">end</span>

<span class="ident">server</span> <span class="punct">=</span> <span class="constant">SomeNewServer</span><span class="punct">.</span><span class="ident">new</span> <span class="number">1234</span>
<span class="ident">server</span><span class="punct">.</span><span class="ident">start</span>
<span class="ident">server</span><span class="punct">.</span><span class="ident">join</span>
</code></pre></div>

...where "1234" is the port used to access the server.  With this setup, you simply cannot access the server from another box, period.  Change the following line:

<div class="ruby"><pre style="overflow: hidden;"><code class="line_number" style="float: left; margin-right: 1em">1</code><code><span class="ident">server</span> <span class="punct">=</span> <span class="constant">SomeNewServer</span><span class="punct">.</span><span class="ident">new</span> <span class="number">1234</span>
</code></pre></div>

...to:
<div class="ruby"><pre style="overflow: hidden;"><code class="line_number" style="float: left; margin-right: 1em">1</code><code><span class="ident">server</span> <span class="punct">=</span> <span class="constant">SomeNewServer</span><span class="punct">.</span><span class="ident">new</span> <span class="number">1234</span><span class="punct">,</span> <span class="punct">'</span><span class="string">myserver.example.com</span><span class="punct">'</span>
</code></pre></div>

...to make your new server accessible to the outside world.  You can use an IP address in place of the domain name.

On the one hand, I was able to just guess at this parameter, and Ruby's Principle of Least Surprise came through for me.  It's more secure, as you don't have to worry about accidentally exposing a massive security hole on your box during development.   On the other hand, it would have been nice to have it clearly listed out somewhere.  Here's hoping that this saves some future googler a guessing game.

