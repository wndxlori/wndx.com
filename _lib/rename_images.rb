#!/usr/bin/env ruby

files = Dir.glob('*.png')

files.each do |post|
  file_name = post.split('.').first
  File.rename(post, "#{file_name}.png")
end
