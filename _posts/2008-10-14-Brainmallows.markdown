---
title: Brainmallows
layout: post
category: programming
published: true
---
I love these things.  They're all filler and no meat, like marshmallow sandwiches.  Which are also delicious.

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
23</code><code><span class="keyword">class </span><span class="class">Jungle</span>
&nbsp;&nbsp;<span class="ident">attr_reader</span> <span class="symbol">:fun</span><span class="punct">,</span> <span class="symbol">:games</span><span class="punct">,</span> <span class="symbol">:everything_you_want</span>

&nbsp;&nbsp;<span class="keyword">def </span><span class="method">welcome</span><span class="punct">(</span><span class="ident">new_user</span><span class="punct">)</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constant">self</span><span class="punct">.</span><span class="ident">new</span><span class="punct">(</span><span class="ident">new_user</span><span class="punct">)</span>
&nbsp;&nbsp;<span class="keyword">end</span>

&nbsp;&nbsp;<span class="keyword">def </span><span class="method">initialize</span><span class="punct">(</span><span class="ident">new_user</span><span class="punct">)</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="punct">(</span><span class="attribute">@@names</span> <span class="punct">||=</span> <span class="punct">[])</span> <span class="punct">&lt;&lt;</span> <span class="ident">new_user</span><span class="punct">.</span><span class="ident">name</span>
&nbsp;&nbsp;<span class="keyword">end</span>

&nbsp;&nbsp;<span class="keyword">def </span><span class="method">find</span><span class="punct">(</span><span class="ident">needs_query</span><span class="punct">)</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">return</span> <span class="punct">&quot;</span><span class="string">Whatever: <span class="expr">#{needs_query}</span></span><span class="punct">&quot;</span>
&nbsp;&nbsp;<span class="keyword">end</span>

&nbsp;&nbsp;<span class="keyword">def </span><span class="method">receive_money</span><span class="punct">(</span><span class="ident">amount</span><span class="punct">)</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment"># TODO: this may be returning an unwanted value</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment"># check with Jim in accounting</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">return</span> <span class="symbol">:your_disease</span> <span class="keyword">if</span> <span class="ident">amount</span> <span class="punct">&gt;</span> <span class="number">0.0</span>
&nbsp;&nbsp;<span class="keyword">end</span>
<span class="keyword">end</span>

<span class="constant">Jungle</span><span class="punct">.</span><span class="ident">welcome</span><span class="punct">(</span><span class="ident">honey</span><span class="punct">)</span>
</code></pre></div>

Answer after the jump.

--- break here ---

Welcome to the Jungle -- Guns 'n' Roses

    Welcome to the jungle
    We got fun 'n' games
    We got everything you want
    Honey we know the names
    We are the people that can find
    Whatever you may need
    If you got the money honey
    We got your disease

