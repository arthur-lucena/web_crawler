#!/usr/bin/env ruby
 
require "rubygems"
require "open-uri"
require "nokogiri"
require "yaml" 
 
 
#puts("type URL: ")
#url=gets
 
#site = open("#{url}")
site = open("http://g1.globo.com")
 
doc = Nokogiri::HTML(site)
 
#puts("type filter:")
#filter=gets
 
#elems = document.css("#{filter}").text
elems = doc.css("a").each do |link|
  puts link.content.gsub(/\s+/, "")
end
#puts YAML::dump(elems)
