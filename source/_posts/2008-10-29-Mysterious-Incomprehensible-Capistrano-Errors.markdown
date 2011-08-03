---
title: Mysterious, Incomprehensible Capistrano Errors
layout: post
category: programming
published: true
---
So yesterday a co-worker and I were fighting fires in our Capistrano deploy scripts.  We'd been updating a crufty monstrosity of a cap script, and were getting  an error along the lines of:
<div class="ruby"><pre style="overflow: hidden;"><code><span class="ident">uninitialized</span> <span class="ident">constant</span> <span class="constant">#&lt;Class:0x7f3230382cf0&gt;::Capistrano::Deploy</span>
</code></pre></div>
After half a day of rolling back every single change we'd made to the scripts in the last week, we discovered a small junk file with some test code we'd stuck in the 'lib/recipes' directory.  It was getting included even though it was not 'require'd anywhere.
<p>PROTIP: CAPISTRANO INCLUDES EVERYTHING IN THE 'lib/recipes' DIRECTORY BECAUSE IT HATES YOU.</p>
<p>Also, it saves typing maybe three lines of code.</p>

