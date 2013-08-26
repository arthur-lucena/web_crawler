require "rubygems"
require "open-uri"
require "nokogiri"

site = open("http://www.softbox.com.br")
doc = Nokogiri::HTML(site)
elems = doc.css("a").each do |link|
  puts  "url: " + link.attr("href").to_s + "\n"
end
