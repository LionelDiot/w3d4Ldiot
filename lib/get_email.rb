require 'nokogiri'
require 'open-uri'

def get_cityhalls_urls(url)
  cityhalls_page = Nokogiri::HTML(URI.open(url))
  cityhalls_urls_hash = {}
  cityhalls_page.css("a.lientxt").each do |el|
    cityhalls_urls_hash[el.text] = "http://www.annuaire-des-mairies.com/#{el['href'].slice!(2..)}"
  end
  return cityhalls_urls_hash
end

def get_cityhall_email(cityhall_url)
  Nokogiri::HTML(URI.open(cityhall_url)).css('table:nth-child(1) tr:nth-child(4) td:nth-child(2)').text
end

def perform(url)
  cityhalls_urls_hash = get_cityhalls_urls(url)
  cityhalls_email = []
  cityhalls_urls_hash.each{ |cityhall_name, cityhall_url|
    pair = {}
    pair[cityhall_name] = get_cityhall_email(cityhall_url)
    cityhalls_email << pair
  }
  return cityhalls_email
end

puts perform("http://www.annuaire-des-mairies.com/val-d-oise.html").inspect
