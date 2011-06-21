---
title: Berceuse Code Lyrical
layout: post
category: programming
published: true
---
Somewhat in the same vein as our last one:

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
32</code><code><span class="keyword">def </span><span class="method">Son</span>
&nbsp;&nbsp;<span class="keyword">def </span><span class="method">pray</span><span class="punct">(</span><span class="ident">beneficiaries</span><span class="punct">)</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">unless</span> <span class="ident">beneficiaries</span><span class="punct">.</span><span class="ident">uniq</span><span class="punct">.</span><span class="ident">size</span> <span class="punct">==</span> <span class="constant">EVERYONE</span><span class="punct">.</span><span class="ident">size</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">raise</span><span class="punct">(</span><span class="constant">ArgumentError</span><span class="punct">,</span> <span class="punct">&quot;</span><span class="string">Prayers should include everyone!</span><span class="punct">&quot;)</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="attribute">@prayed</span> <span class="punct">=</span> <span class="constant">true</span>
&nbsp;&nbsp;<span class="keyword">end</span>

&nbsp;&nbsp;<span class="keyword">def </span><span class="method">tuck</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">if</span> <span class="attribute">@prayed</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ident">internal_temperature</span> <span class="punct">=</span> <span class="number">99.9</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="attribute">@sin_free</span> <span class="punct">=</span> <span class="constant">true</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span>
&nbsp;&nbsp;<span class="keyword">end</span>

&nbsp;&nbsp;<span class="keyword">def </span><span class="method">sleeping</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">unless</span> <span class="attribute">@eyes_open</span> <span class="punct">&gt;=</span> <span class="number">1</span> <span class="punct">&amp;&amp;</span> <span class="attribute">@pillow</span><span class="punct">.</span><span class="ident">gripped?</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="attribute">@anthropomrphic_personification</span> <span class="punct">=</span> <span class="constant">Sandman</span><span class="punct">.</span><span class="ident">enter</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="attribute">@sin_free</span> <span class="punct">=</span> <span class="constant">false</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="keyword">end</span>
&nbsp;&nbsp;<span class="keyword">end</span>
<span class="keyword">end</span>

<span class="keyword">def </span><span class="method">Sandman</span>
&nbsp;&nbsp;<span class="keyword">def </span><span class="method">enter</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constant">Light</span><span class="punct">.</span><span class="ident">exit</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constant">Night</span><span class="punct">.</span><span class="ident">enter</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constant">Hand</span><span class="punct">.</span><span class="ident">take</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="ident">never_never_land</span><span class="punct">(</span><span class="symbol">:off</span><span class="punct">)</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="constant">self</span><span class="punct">.</span><span class="ident">new</span>
&nbsp;&nbsp;<span class="keyword">end</span>
<span class="keyword">end</span>
</code></pre></div>

--- break here ---

Enter the Sandman by Metallica

    Say your prayers little one
    Don't forget, my son
    To include everyone
    
    Tuck you in, warm within
    Keep you free from sin
    Till the sandman he comes
    
    Sleep with one eye open
    Gripping your pillow tight
    
    Exit light
    Enter night
    Take my hand
    Off to never never land

