require "rubygems"
require "open-uri"
require "nokogiri"

doc = Nokogiri::HTML(open("http://arthurvieira.com"))
doc.css("a").each do |link|
  puts  "href: " + link.attr("href") + "\n"
end
