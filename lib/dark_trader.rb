require 'nokogiri'
require 'open-uri'

def download_coinmarket
  Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
end

def coin_name(coinmarket)
  coin_name_array = []
  coinmarket.css("tbody tr td div a.cmc-table__column-name--symbol").each do |el|
    coin_name_array << el.text
  end
  return coin_name_array
end

def coin_value(coinmarket)
  coin_value_array = []
  coinmarket.css("tbody tr td div a.cmc-link span").each do |el|
    coin_value_array << el.text
  end
  return coin_value_array
end

def coin_hash(coin_value_array, coin_name_array)
  coin_hash_array = []
  coin_name_array.each_with_index { |name, index|
    pair = {}
    pair[name] = coin_value_array[index]
    coin_hash_array << pair
  }
  return coin_hash_array
end

puts coin_hash(coin_value(download_coinmarket), coin_name(download_coinmarket)).inspect
