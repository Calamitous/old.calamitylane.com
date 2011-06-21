---
title: Formatting Numbers with Ruby
layout: post
category: programming
published: false
---
fmt = "%+03d"

(-24..24).each { |z| puts "#{fmt % z}\t=>\t" + Time.parse("2011-11-01 12:12:12 #{fmt % z}:00").to_s }

