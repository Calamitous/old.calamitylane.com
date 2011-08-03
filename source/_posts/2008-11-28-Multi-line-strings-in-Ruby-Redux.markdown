---
title: Multi-line strings in Ruby Redux
layout: post
category: programming
published: false
---
Someone once took exception to the C# example in my <r:link href="/articles/programming/multi-line-strings-in-ruby">previous post</r:link> on this subject, muttering that I'd used string interpolation for the Ruby code, but string concatenation for the C# code, which was wrong-headed and unfair.  Additionally, my gender preference was strongly questioned.

In the interest of showing some of Rails' stringy goodness, I'd like to present the following example:

String.Format("SELECT * FROM orders WHERE category_id => {0} OR purchased_on <= {1} ", category_id, DateTime.Now.ToString());

In Rails, you can get more or less the same functionality in your conditions clause if you need one:

Orders.find(:all, 
  :conditions => ["category_id = ? OR purchased_on < ?", category, Time.now.to_s(:db)]
)

Hm.  That works, I guess, but in Rails there's a better way: named parameters.

Define your parameters in a hash:

params = {:category => category_id, :today => Time.now.to_s(:db)}

...then you can add it to your condition string like so:

Orders.find(:all, 
  :conditions => ["category_id = :category OR purchased_on < :today", params]
)

Mmmmm, that's tasty code beef.

