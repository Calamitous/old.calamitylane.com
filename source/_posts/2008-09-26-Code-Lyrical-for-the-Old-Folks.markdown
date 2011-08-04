---
title: Code Lyrical, for the Old Folks
layout: post
category: programming
published: true
---
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
13</code><code><span class="keyword">def </span><span class="method">i</span><span class="punct">(</span><span class="ident">arg</span><span class="punct">)</span>
&nbsp;&nbsp;<span class="keyword">case</span> <span class="ident">arg</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">when</span> <span class="ident">older</span><span class="punct">.</span><span class="ident">reject</span><span class="punct">(&amp;</span><span class="symbol">:my_hair</span><span class="punct">)</span> <span class="punct">&amp;&amp;</span> <span class="ident">years</span><span class="punct">.</span><span class="ident">from_now</span> <span class="punct">&gt;=</span> <span class="constant">MANY</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ident">send</span><span class="punct">(</span><span class="symbol">:valentine</span><span class="punct">,</span> <span class="symbol">:birthday_greetings</span><span class="punct">,</span> <span class="symbol">:bottle_of_wine</span><span class="punct">)</span>
&nbsp;&nbsp;<span class="keyword">end</span>
&nbsp;&nbsp;<span class="ident">door</span><span class="punct">.</span><span class="ident">lock</span> <span class="keyword">if</span> <span class="constant">Time</span><span class="punct">.</span><span class="ident">now</span> <span class="punct">&gt;=</span> <span class="constant">Time</span><span class="punct">.</span><span class="ident">parse</span><span class="punct">('</span><span class="string">2:45</span><span class="punct">')</span>
<span class="keyword">end</span>

<span class="keyword">def </span><span class="method">need</span><span class="punct">(</span><span class="ident">age</span><span class="punct">)</span>
&nbsp;&nbsp;<span class="ident">age</span> <span class="punct">&lt;=</span> <span class="constant">TOO_OLD</span>
<span class="keyword">end</span>

<span class="keyword">alias</span> <span class="symbol">:feed</span><span class="punct">,</span> <span class="symbol">:need</span>
</code></pre></div>

<!-- more -->

When I'm 64 -- The Beatles

    When I get older losing my hair,
    Many years from now
    Will you still be sending me a valentine,
    Birthday greetings, bottle of wine?
    Will you still be sending me a valentine
    Birthday greetings, bottle of wine?
    If I'd been out till quarter to three
    Would you lock the door?
    Will you still need me, will you still feed me
    When I'm sixty-four? 

