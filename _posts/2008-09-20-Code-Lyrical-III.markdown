---
title: Code Lyrical III
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
13</code><code><span class="keyword">class </span><span class="class">Object</span>
&nbsp;&nbsp;<span class="keyword">alias</span> <span class="ident">old_is_a?</span> <span class="ident">is_a?</span>
&nbsp;&nbsp;<span class="keyword">def </span><span class="method">is_a?</span><span class="punct">(</span><span class="ident">klass</span><span class="punct">)</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">if</span> <span class="ident">klass</span> <span class="punct">==</span> <span class="constant">Thing</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">return</span> <span class="constant">self</span><span class="punct">.</span><span class="ident">respond_to?</span><span class="punct">(</span><span class="symbol">:that_swing</span><span class="punct">)</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="ident">old_is_a?</span><span class="punct">(</span><span class="ident">klass</span><span class="punct">)</span>
&nbsp;&nbsp;<span class="keyword">end</span>
<span class="keyword">end</span>

<span class="keyword">if</span> <span class="ident">it</span><span class="punct">.</span><span class="ident">is_a?</span> <span class="constant">Thing</span>
&nbsp;&nbsp;<span class="number">8</span><span class="punct">.</span><span class="ident">times</span><span class="punct">(</span><span class="ident">doo_wah</span><span class="punct">)</span>
<span class="keyword">end</span>
</code></pre></div>

Answer after the jump.

<!-- read more -->

"It Don't Mean A Thing (If It Ain't Got That Swing)" by Duke Ellington and Ella Fitzgerald

    It don't mean a thing if it ain't got that swing,
    doo-wah, doo-wah, doo-wah, doo-wah, doo-wah, doo-wah, doo-wah, doo-wah

