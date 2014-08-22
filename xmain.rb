#!/usr/bin/env ruby
 
require "rubygems"
require "open-uri"
require "nokogiri"
require "yaml" 

def matchContentLink (regex, document)
	document.css("a").each do |link|
		if regex.match(link.content)
			puts "---------------------------"
			puts link.content.strip#.gsub(/\s+/, "")
			puts link.attribute("href")
			puts "\n"
		else 
	end
end

def main 
	config = YAML.load_file("config.json");
	url = config["url"]
	site = open(url)

	doc = Nokogiri::HTML(site)

	matchContentLink(/google(.*)/i, doc)
end

main
