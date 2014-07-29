#!/usr/bin/env ruby
 
require "rubygems"
require "open-uri"
require "nokogiri"
require "yaml" 
 

config = YAML.load_file("config.json");
url = config["url"]
#puts("type URL: ")
#url=gets
 
#site = open("#{url}")
site = open(url)
 
doc = Nokogiri::HTML(site)
 
#puts("type filter:")
#filter=gets
 
#elems = document.css("#{filter}").text
elems = doc.css("a").each do |link|
  puts link.content.gsub(/\s+/, "")
end
#puts YAML::dump(elems)
