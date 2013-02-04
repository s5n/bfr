# "mabf" reloaded
# Kleines Skript um mal eben zu sehen welche Bahn/Bahn
# in den nächsten Minuten abfährt. 

require 'rubygems'
require 'nokogiri'
require 'mechanize'

agent = Mechanize.new

page = agent.get('http://google.com/')

page.links.each do |link|
  puts link.text
end