require 'nokogiri'
require 'open-uri'

def get_deputy_infos
  page = Nokogiri::HTML(URI.open("https://wiki.laquadrature.net/Contactez_vos_d%C3%A9put%C3%A9s"))
  deputy_infos_array = []
  page.css("div.mw-parser-output h2 + ul li").each do |el|
    
    deputy_infos_array << el.text
  end
  page.css("div.mw-parser-output h3 + ul li").each do |el|
    
    deputy_infos_array << el.text
  end
  page.css("div.mw-parser-output h2 + p + ul li").each do |el|
    
    deputy_infos_array << el.text
  end
  page.css("div.mw-parser-output ul + ul li").each do |el|
    deputy_infos_array << el.text
  end
  return deputy_infos_array
end

def each_deputy_hash(deputy_string)
  
  first_name = deputy_string.split.first
  deputy_string = deputy_string.slice(first_name.length + 1, deputy_string.length)
  end_of_lastname_index=deputy_string.rindex("(")
  last_name = deputy_string.slice!(0..end_of_lastname_index-2)
  deputy_email="no email"
  email_index=deputy_string.rindex(":")
  deputy_string.slice!(0..email_index+1) unless email_index.nil?
  deputy_email=deputy_string.split.first
  deputy_email = deputy_email.chop  if deputy_email.end_with?(";")

  
  deputy_hash = {"first name"=> first_name,"last name" => last_name, "email" => deputy_email}
  return deputy_hash
end

def create_deputy_array
  deputy_profiles_array = []
  get_deputy_infos.each { |deputy_strings|
     
    deputy_profiles_array << each_deputy_hash(deputy_strings)
  }
  return deputy_profiles_array
end

puts create_deputy_array.inspect
