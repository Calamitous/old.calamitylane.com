---
title: Multi-line strings in Ruby-- I Love Carriage Returns!
layout: post
category: programming
published: true
---
If you've ever done any serious development in VB or the old VBScript, you've probably done something like this:

    strSQL = "SELECT o.* " & _
             "FROM people p " & _
             "INNER JOIN orders o " & _
             "ON o.person_id = p.id " & _
             "WHERE person_id = " & PersonID & ";"

<!-- more -->

...which is highly readable, but a huge pain to debug, especially when trying to cut-n-paste into the query window. How many of us have learned BkSp-BkSp-BkSp-Down-End-repeat-ad-infinitum? In fact, if you were to take every '" & \_' and ' "' I've ever deleted and stack them up on top of one another, you would probably end up with a stack... well, several inches high. Let's face it, electrons just aren't that big.

Fed up with this state of affairs, many of us moved to C# for development, leading to:

    strSQL =          "SELECT o.* ";
    strSQL = strSQL + "FROM people p ";
    strSQL = strSQL + "INNER JOIN orders o ";
    strSQL = strSQL + "  ON o.person_id = p.id ";
    strSQL = strSQL + "WHERE person_id = " + PersonID.ToString() + ";

In the computer industry, this is called "progress."

Of course, if you wanted to make debugging simpler, you could stuff the entire string on one line:

    strSQL = "SELECT o.* FROM people p INNER JOIN orders o ON o.person_id = p.id WHERE person_id = " + PersonID.ToString() + ";"

...which is a lot easier to cut-n-paste, but a lot less easy to read.

Which is where Ruby comes in. Same query in Ruby:

<div class="ruby"><pre style="overflow: hidden;"><code class="line_number" style="float: left; margin-right: 1em">1
2
3
4
5
6</code><code><span class="ident">strSQL</span> <span class="punct">=</span> <span class="punct">&quot;</span><span class="string">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SELECT o.*
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FROM people p
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;INNER JOIN orders o ON o.person_id = p.id
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;WHERE person_id = <span class="expr">#{person_id.to_s}</span>;
&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="punct">&quot;</span>
</code></pre></div>

Isn't it bee-yoo-tee-ful? Readable, functional, and oh so copy-pasteable. Also, it does not require extra punctuation to patch together a simple multi-line query.

There are about 19,000 different ways to define a string in Ruby, but it's the simple timesavers like this that make the language really shine.

Of course, if you were using Rails, you could just

<div class="ruby"><pre style="overflow: hidden;"><code class="line_number" style="float: left; margin-right: 1em">1</code><code><span class="constant">Person</span><span class="punct">.</span><span class="ident">find</span><span class="punct">(</span><span class="ident">person_id</span><span class="punct">).</span><span class="ident">orders</span>
</code></pre></div>

...which just goes to show how much smarter and more sexually attractive Railers are than everybody else.

NOTE: Originally, I was going to include connection and execution of the query, but that would have blown the VBScript and Ruby examples up an extra four lines of code each. Using recommended practices, it would have bloated the C# code up another 15 lines, plus a stored procedure definition.

The Rails example would still have been only one line. Simplicity ftw!

