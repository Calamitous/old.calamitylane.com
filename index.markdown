---
layout: default
title: Calamity Lane
---

{% for post in site.posts %} 
  {{ post.date | date_to_string }} - <a href="{{ post.url }}">{{ post.title }}</a><br>
  {{ post.excerpt }}

  <a href="{{ post.url }}">Read More...</a><br>
{% endfor %}

