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
# iterando pelos links da página principal
doc.css("a").each do |link|
	# encontrado uma palavra no link 
	if /não(.*)/i.match(link.content)
		#puts YAML::dump(link)
		puts "---------------------------"
		puts link.content.strip#.gsub(/\s+/, "")
		puts link.attribute("href")
		puts "\n"
	else 
		#puts "não é um link procurado"
	end	
end
