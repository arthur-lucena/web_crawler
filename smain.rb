require "rubygems"
require "open-uri"
require "nokogiri"

doc = Nokogiri::HTML(open("http://arthurvieira.com"))
doc.css("a").each do |link|
  urlFull = link.attr("href")
  urls = urlFull.scan(/^((http[s]?|ftp):\/)?\/?([^:\/\s]+)((\/\w+)*\/)([\w\-\.]+[^#?\s]+)(.*)?(#[\w\-]+)?$/)#.split(/\s+/).find_all { |u| u =~ /https?:\/\/[\S]+/ }
  
  urls.each do |url|
    puts url
  end
end
