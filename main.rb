#!/usr/bin/env ruby
 
require "rubygems"
require "open-uri"
require "nokogiri"
require "yaml" 

#=> #<Encoding:UTF-8>

config = YAML.load_file("config.json");
url = config["url"]
#puts("type URL: ")
#url=gets
 
#site = open("#{url}")
site = open(url)

doc = Nokogiri::HTML(site)

#encoding = nil;
#doc.css('meta[http-equiv="Content-Type"]').each do |key|
#	stringContent = key.attribute("content").content
#	equalIndex = stringContent.index('=')
#	encoding = stringContent[equalIndex + 1, stringContent.length]
#end 
#puts encoding

#puts("type filter:")
#filter=gets
 
#elems = document.css("#{filter}").text
elems = doc.css("a").each do |link|
	puts "---------------------------"
	#puts YAML::dump(link)
	puts link.content.strip#.gsub(/\s+/, "")
end
#puts YAML::dump(elems)
