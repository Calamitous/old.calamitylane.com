#!/usr/bin/env ruby
require 'yaml'

MAX_TITLE_LENGTH = 60
spacer = ' ' * MAX_TITLE_LENGTH
EDITOR = 'gvim'

file_list = Dir['source/_posts/*']

file_list.each_with_index do |filename, i|
  post = YAML.load_file(filename)
  next if post['published']

  date = File.basename(filename)[0..9]
  title = post['title']
  ellipses = title.length > MAX_TITLE_LENGTH ? '...' : ''

  puts "#{i}\t#{(title + spacer)[0..MAX_TITLE_LENGTH]}#{ellipses}\t#{date}"
end

#puts 'Please enter the number of the post you want to edit'

#wat = gets

#file_to_edit = file_list[wat.to_i]
#if file_to_edit
  #`gvim ./#{file_to_edit}`
#end
