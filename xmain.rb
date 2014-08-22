#!/usr/bin/env ruby
 
require "rubygems"
require "open-uri"
require "nokogiri"
require "yaml" 

def matchContentLink (regex, document)
	document.css("a").each do |link|
		if regex.match(link.content)
			puts "---------------------------"
			puts link.content.strip
			urlHref = link.attribute("href")

			unless /http:\/\//i.match(urlHref)
				urlHref = "http:/" + urlHref
			end

			puts urlHref

			puts "\n"
		end
	end
end

def openUrl (url)
	site = open(url)

	document = Nokogiri::HTML(site)

	matchContentLink(/google(.*)/i, document)
end

def main 
	config = YAML.load_file("config.json");
	url = config["url"]
	
	openUrl(url)
end

main
