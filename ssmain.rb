require "rubygems"
require "open-uri"
require "nokogiri"
require "yaml"

config = YAML.load_file("config.json");
url = config["url"]

def isEmpty(param)
	if !param.nil?
		return param[2]
	else 
		return "vazio"
	end
end

doc = Nokogiri::HTML(open(url))
doc.css("a").each do |link|
  urlFull = link.attr("href")
  urlBreaked = urlFull.scan(/^((http[s]?|ftp):\/)?\/?([^:\/\s]+)((\/\w+)*\/)([\w\-\.]+[^#?\s]+)(.*)?(#[\w\-]+)?$/)#.split(/\s+/).find_all { |u| u =~ /https?:\/\/[\S]+/ }
 
  urlBreaked = urlBreaked[0]
	puts urlBreaked.inspect
  
  #puts "https: " + urlBreaked[0]
  #puts "http: " + urlBreaked[1]
  puts "host: " + !urlBreaked.nil? ? urlBreaked[2] : "null"
  #puts "path: " + urlBreaked[3]
  #puts "segments of path array: " + urlBreaked[4]
  #puts "file: " + urlBreaked[5]
  #puts "query: " + urlBreaked[6]
  #puts "hash: " + urlBreaked[7]

end
