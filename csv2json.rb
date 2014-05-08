#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-  
require 'csv'
require 'json'
require 'net/http'  
require 'open-uri'  
require 'iconv'

def to_utf(str)
  Iconv.iconv("UTF-8//IGNORE","GBK//IGNORE",str).to_s
end

def read_file(file)
  File.open(file, 'r') { |f| f.read }
end

def open_csv_file_with_encode(file_name, char_set)
	CSV.parse(read_file(file_name).force_encoding(char_set).encode("utf-8")) do |row|
  		puts row.inspect
	end
end

def open_csv_file(file_name, char_set)
	lines = CSV.open(file_name).readlines
	keys = lines.delete lines.first
 
	File.open("test1.json", 'w') do |f|
  		data = lines.map do |values|
    		Hash[keys.zip(values)]
  		end
  		f.puts JSON.pretty_generate(data)
	end
end

def get_utf8_body(url)  
    uri = URI.parse(url)  
    res = Net::HTTP.start(uri.host, uri.port) {|http|  
      http.get(uri.path)  
    }  
    #body = Iconv.iconv("UTF-8//IGNORE","BIG5//IGNORE",res.body)  
    body = res.body.force_encoding('big5').encode('UTF-8')  
    return body  
end  

if __FILE__ == $0 #main
	#Test 1 parse utf8 url
  #body = get_utf8_body('http://www.richyli.com/name/novel.asp')  
	#print(body)
  
	open_csv_file_with_encode("hotspotlist.csv", "big5")
end
