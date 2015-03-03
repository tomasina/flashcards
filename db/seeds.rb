# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'open-uri'

doc = Nokogiri::HTML(open("http://www.languagedaily.com/learn-german/vocabulary/common-german-words"))

words_list = doc.css('table tr')

words_list.css("tr").each do |item|
  original =  item.css('td')[1].text
  translated = item.css('td')[2].text
  Card.create!( original_text: original, translated_text: translated )
end
