require "rubygems"
require "open-uri"
require "nokogiri"
require "yaml"

config = YAML.load_file("config.json");
url = config["url"]

site = Nokogiri::HTML(open(url))
site.css("a").each do |link|
	a_href = link.attr("href")
	
	if a_href != nil 
		link =  Nokogiri::HTML(open("a_href"))
		
		link.css("p").each do |p|
			puts(p)
		end
	end
end
