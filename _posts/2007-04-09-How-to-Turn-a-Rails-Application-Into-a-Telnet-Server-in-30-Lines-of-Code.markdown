---
title: "How to Turn a Rails Application Into a Telnet Server in 30 Lines of Code!"
layout: post
category: programming
published: true
---
Ruby on Rails is a beautiful thing; simple, fast, and powerful. As they say, it takes the pain out of web development.

I'm fortunate enough to have been able to use Rails at work for a few months now, and the more I learn about the Rails framework and the Ruby language, the more enamoured I become of the simplicity, beauty, and zen-like nature of these tools. But you didn't come here to see me gush with adoration like a schoolgirl at an Elvis concert, you came to see:

#### How to Turn a Rails Application Into a Telnet Server in 30 Lines of Code!

--- break here ---

&nbsp;

<div class="warning">
<h3>PLEASE DON'T DO THIS!</h3>
<p>
What follows was intended to illustrate the power and flexibility of Ruby, not to kickstart somebody's server project.  It's alarming that this has been the most popular page on my blog for nearly a year, and somewhat embarrassing that I haven't let people know more explicitly that this should not be used in real software.
</p><p>
If you need to write a telnet server, you should really, really really be using <a href="http://rubyforge.org/projects/eventmachine">EventMachine</a> anyway, which is better than GServer in just about every possible way.  GServer is still OK for knocking out spikes or quick prototypes, just be aware that GServer runs in an event loop, whereas EventMachine uses callbacks-- anything you write will need to be retooled to move from one to the other.
</p><p>
That said, here's the original article.
</p>
</div>

First, some code:

<div class="ruby"><pre style="overflow: hidden;"><code class="line_number" style="float: left; margin-right: 1em">&nbsp;1
&nbsp;2
&nbsp;3
&nbsp;4
&nbsp;5
&nbsp;6
&nbsp;7
&nbsp;8
&nbsp;9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34</code><code><span class="comment">#!/usr/bin/env ruby</span>
<span class="ident">require</span> <span class="punct">'</span><span class="string">config/environment</span><span class="punct">'</span>
<span class="ident">require</span> <span class="punct">'</span><span class="string">gserver</span><span class="punct">'</span>

<span class="keyword">class </span><span class="class">TestServer</span> <span class="punct">&lt;</span> <span class="constant">GServer</span>
&nbsp;&nbsp;<span class="keyword">def </span><span class="method">serve</span><span class="punct">(</span><span class="ident">io</span><span class="punct">)</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">begin</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ident">io</span><span class="punct">.</span><span class="ident">puts</span> <span class="punct">'</span><span class="string">&gt;&gt; WELCOME &lt;&lt;</span><span class="punct">'</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ident">loop</span> <span class="keyword">do</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">begin</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ident">telnet_input</span> <span class="punct">=</span> <span class="ident">io</span><span class="punct">.</span><span class="ident">gets</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">break</span> <span class="keyword">if</span> <span class="ident">telnet_input</span> <span class="punct">=~</span> <span class="punct">/</span><span class="regex"><span class="escape">A</span>quit<span class="escape"></span></span><span class="punct">/</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ident">io</span><span class="punct">.</span><span class="ident">puts</span> <span class="ident">eval</span><span class="punct">(</span><span class="ident">telnet_input</span><span class="punct">)</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">rescue</span> <span class="constant">Exception</span> <span class="punct">=&gt;</span> <span class="ident">e</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment"># Got kabooms from trying to eval user input</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment"># Catch it &amp; let the user know</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ident">io</span><span class="punct">.</span><span class="ident">puts</span> <span class="punct">&quot;</span><span class="string">Oops - <span class="expr">#{e}</span></span><span class="punct">&quot;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ident">log</span> <span class="punct">&quot;</span><span class="string">Received <span class="expr">#{telnet_input}</span></span><span class="punct">&quot;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ident">io</span><span class="punct">.</span><span class="ident">puts</span> <span class="punct">&quot;</span><span class="string">&gt;&gt; GOODBYE &lt;&lt;</span><span class="punct">&quot;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ident">io</span><span class="punct">.</span><span class="ident">close</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">rescue</span> <span class="constant">Exception</span> <span class="punct">=&gt;</span> <span class="ident">e</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment"># The server blew up... handle it here</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ident">puts</span> <span class="punct">&quot;</span><span class="string">DOH! - <span class="expr">#{e}</span></span><span class="punct">&quot;</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span>
&nbsp;&nbsp;<span class="keyword">end</span>
<span class="keyword">end</span>


<span class="ident">ts</span> <span class="punct">=</span> <span class="constant">TestServer</span><span class="punct">.</span><span class="ident">new</span> <span class="number">1234</span>
<span class="ident">ts</span><span class="punct">.</span><span class="ident">start</span>
<span class="ident">ts</span><span class="punct">.</span><span class="ident">audit</span> <span class="punct">=</span> <span class="constant">true</span>
<span class="ident">ts</span><span class="punct">.</span><span class="ident">join</span>
</code></pre></div>

This code should work, as is, on just about any Rails application (as far as I've been able to tell; it's worked on the few I've tried).

Last night I was tooling around, playing with code. I'd had an idea for some server software I'd like to write, so I mocked up a quick throwaway system in Rails, and started playing around with some of the logic. I liked the results, and I'd already decided I wanted to write the server in Ruby, but the thought of taking all that functionality and porting everything to DBI calls or whatever was handy just made me tired, especially since Rails does all the tedious database tasks for you.

Fortunately, I'm slowly learning that Ruby is written for lazy programmers, and after a little Googling and some educated guesses, I was able to whack the entire Rails app into a script simply by including:

<div class="ruby"><pre><code>  <span class="ident">require</span> <span class="punct">'</span><span class="string">config/environment</span><span class="punct">'</span>
</code></pre></div>

...at the top of a file in the project root. This makes everything available to your application.

<div class="ruby"><pre><code>  <span class="comment">#!/usr/bin/env ruby</span>
  <span class="ident">require</span> <span class="punct">'</span><span class="string">config/environment</span><span class="punct">'</span>
  <span class="ident">require</span> <span class="punct">'</span><span class="string">gserver</span><span class="punct">'</span>
</code></pre></div>

This sets the scripting environment, includes the Rails app, and makes the GServer class available. GServer is a freebie that comes with Ruby, so there's no need for gem installs or other libraries.

<div class="ruby"><pre><code>  <span class="keyword">class </span><span class="class">TestServer</span> <span class="punct">&lt;</span> <span class="constant">GServer</span>
    <span class="keyword">def </span><span class="method">serve</span><span class="punct">(</span><span class="ident">io</span><span class="punct">)</span>
</code></pre></div>

We're then creating our own class which inherits from GServer, and overriding its "serve" method, which is where all the interesting stuff happens.

<div class="ruby"><pre><code>  <span class="ident">io</span><span class="punct">.</span><span class="ident">puts</span> <span class="punct">'</span><span class="string">&gt;&gt; WELCOME &lt;&lt;</span><span class="punct">'</span>
  <span class="ident">loop</span> <span class="keyword">do</span>
    <span class="keyword">begin</span>
      <span class="ident">telnet_input</span> <span class="punct">=</span> <span class="ident">io</span><span class="punct">.</span><span class="ident">gets</span>
      <span class="keyword">break</span> <span class="keyword">if</span> <span class="ident">telnet_input</span> <span class="punct">=~</span> <span class="punct">/</span><span class="regex"><span class="escape">A</span>quit<span class="escape"></span></span><span class="punct">/</span>
      <span class="ident">io</span><span class="punct">.</span><span class="ident">puts</span> <span class="ident">eval</span><span class="punct">(</span><span class="ident">telnet_input</span><span class="punct">)</span>
    <span class="keyword">end</span>
    <span class="ident">log</span> <span class="punct">&quot;</span><span class="string">Received <span class="expr">#{telnet_input}</span></span><span class="punct">&quot;</span>
  <span class="keyword">end</span>
  <span class="ident">io</span><span class="punct">.</span><span class="ident">puts</span> <span class="punct">&quot;</span><span class="string">&gt;&gt; GOODBYE &lt;&lt;</span><span class="punct">&quot;</span>
  <span class="ident">io</span><span class="punct">.</span><span class="ident">close</span>
</code></pre></div>

This is the heart of the server (without the exception handling). Simply speaking, the serve() method is what handles user connections, and the "io" object lets us do gets and puts across the wire.

When a user connects, we spit out a welcome message, then go into an endless loop that responds to user requests. The following:

<div class="ruby"><pre><code>  <span class="ident">telnet_input</span> <span class="punct">=</span> <span class="ident">io</span><span class="punct">.</span><span class="ident">gets</span>
</code></pre></div>

...grabs whatever line the user types in, terminating by default on a carriage return. We need to throw the result of io.gets into a variable, since making multiple calls to io.gets will cause the system to grab multiple lines of input from the stream.

<div class="ruby"><pre><code>  <span class="keyword">break</span> <span class="keyword">if</span> <span class="ident">telnet_input</span> <span class="punct">=~</span> <span class="punct">/</span><span class="regex"><span class="escape">A</span>quit$</span><span class="punct">/</span>
</code></pre></div>

...kicks us out of the loop if the user types "quit". The "A" portion of the regex matches the beginning of the string, and the "$" matches the "end of line" character.

<div class="ruby"><pre><code>  <span class="ident">io</span><span class="punct">.</span><span class="ident">puts</span> <span class="ident">eval</span><span class="punct">(</span><span class="ident">telnet_input</span><span class="punct">)</span>
  <span class="ident">log</span> <span class="punct">&quot;</span><span class="string">Received <span class="expr">#{telnet_input}</span></span><span class="punct">&quot;</span>
</code></pre></div>

The first line here does an eval() on whatever the user typed in, returning the value back across the wire. This should allow the user to run any command that Ruby (and your Rails app) will accept. The second line spits whatever the user typed in to the console where the server is running.

<div class="ruby"><pre><code>  <span class="ident">io</span><span class="punct">.</span><span class="ident">puts</span> <span class="punct">&quot;</span><span class="string">&gt;&gt; GOODBYE &lt;&lt;</span><span class="punct">&quot;</span>
  <span class="ident">io</span><span class="punct">.</span><span class="ident">close</span>
</code></pre></div>

Once the loop is broken, we burp out a fond farewell and cleanly close the connection.

<div class="ruby"><pre><code>  <span class="ident">ts</span> <span class="punct">=</span> <span class="constant">TestServer</span><span class="punct">.</span><span class="ident">new</span> <span class="number">1234</span>
  <span class="ident">ts</span><span class="punct">.</span><span class="ident">start</span>
  <span class="ident">ts</span><span class="punct">.</span><span class="ident">audit</span> <span class="punct">=</span> <span class="constant">true</span>
  <span class="ident">ts</span><span class="punct">.</span><span class="ident">join</span>
</code></pre></div>

The rest of the code just sets a few variables and runs the service. The "1234" on the creation of the "ts" object sets the listening port. Turning on auditing allows us to see when someone logs on and off from the console (which can easily be redirected to a log file).

##### CAVEATS:

This is an extremely simple server. It has no security, no performance optimization, and probably has more holes than a cheesecloth factory. It is very naïve, and while it technically allows multiple users to log on, they'll all share the same class variables. Really, it's only interesting at this point to show what can be done.

That having been said, the ease with which I managed it is one of the many testaments to Ruby's power and simplicity. I've programmed for many years, coded a number of servers, and this was the first time I've ever felt drunk with power after a coding session. "I can do anything!" I bellowed as I reeled around the room, knocking old monitors and dusty programming tomes off the desk. "No one can stop me!" Fortunately, my wife, who is a lot more level-headed than I am, pointed out that she could, indeed, stop me, since it had gone past two in the morning.

