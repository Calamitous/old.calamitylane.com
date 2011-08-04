---
title: Select Tag Funkiness With Merb
layout: post
category: programming
published: true
---
In my ongoing travails with Merb & Friends, I've run across a few behaviors with the select() form helper method.  Since there's currently a dearth of examples, I thought I'd document them for myself and future googlers.

<!-- more -->

If you're having problems getting select() to work in Merb, bear the following in mind:

If you type the following:

<div class="ruby"><pre style="overflow: hidden;"><code class="line_number" style="float: left; margin-right: 1em">1</code><code><span class="ident">select</span> <span class="symbol">:widget_id</span><span class="punct">,</span> <span class="symbol">:collection</span> <span class="punct">=&gt;</span> <span class="constant">Widget</span><span class="punct">.</span><span class="ident">all</span>
</code></pre></div>

You may get the error:

    undefined method 'first' in <Widget:0x7fae15562fc8>

(you may also get "undefined method 'last'")

select() expects two options to be passed in: :value\_method and :text\_method.  If you provide neither, Merb will assume that your collection is an array, and will default them to the 'first' and 'last' methods respectively.  Add your field names or methods explicitly to make select() happy:

<div class="ruby"><pre style="overflow: hidden;"><code class="line_number" style="float: left; margin-right: 1em">1
2</code><code><span class="ident">select</span> <span class="symbol">:widget_id</span><span class="punct">,</span> <span class="symbol">:collection</span> <span class="punct">=&gt;</span> <span class="constant">Widget</span><span class="punct">.</span><span class="ident">all</span><span class="punct">,</span> <span class="symbol">:value_method</span> <span class="punct">=&gt;</span> <span class="symbol">:id</span><span class="punct">,</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="symbol">:text_method</span> <span class="punct">=&gt;</span> <span class="symbol">:name</span>
</code></pre></div>

Additionally, there's a strange behavior, in which the :selected option appears to be ignored-- when you pull your form back up after a save, the select box will be back on the default value:

<div class="ruby"><pre style="overflow: hidden;"><code class="line_number" style="float: left; margin-right: 1em">1
2</code><code><span class="ident">select</span> <span class="symbol">:widget_id</span><span class="punct">,</span> <span class="symbol">:collection</span> <span class="punct">=&gt;</span> <span class="constant">Widget</span><span class="punct">.</span><span class="ident">all</span><span class="punct">,</span><span class="symbol">:value_method</span> <span class="punct">=&gt;</span> <span class="symbol">:id</span><span class="punct">,</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="symbol">:text_method</span> <span class="punct">=&gt;</span> <span class="symbol">:name</span><span class="punct">,</span> <span class="symbol">:selected</span> <span class="punct">=&gt;</span> <span class="attribute">@whongo</span><span class="punct">.</span><span class="ident">widget_id</span>
</code></pre></div>

The problem here is that Merb expects the :selected option to be a string.  Cast your selected value to a string and all will be well:

<div class="ruby"><pre style="overflow: hidden;"><code class="line_number" style="float: left; margin-right: 1em">1
2</code><code><span class="ident">select</span> <span class="symbol">:widget_id</span><span class="punct">,</span> <span class="symbol">:collection</span> <span class="punct">=&gt;</span> <span class="constant">Widget</span><span class="punct">.</span><span class="ident">all</span><span class="punct">,</span><span class="symbol">:value_method</span> <span class="punct">=&gt;</span> <span class="symbol">:id</span><span class="punct">,</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="symbol">:text_method</span> <span class="punct">=&gt;</span> <span class="symbol">:name</span><span class="punct">,</span> <span class="symbol">:selected</span> <span class="punct">=&gt;</span> <span class="attribute">@whongo</span><span class="punct">.</span><span class="ident">widget_id</span><span class="punct">.</span><span class="ident">to_s</span>
</code></pre></div>

