# "mabf" reloaded
# Kleines Skript um mal eben zu sehen welche Bahn/Bahn
# in den nächsten Minuten abfährt. 
require 'rubygems'
require 'nokogiri'
require 'mechanize'

#source, destination, 
# Univers./Zentralbereich
# Hauptbahnhof

class Bsag
  def initialize(start_station="Univers./Zentralbereich", stop_station="Hauptbahnhof")
    @start_station = start_station
    @stop_station = stop_station
  end

  def search_connection
    agent = Mechanize.new { |a| a.user_agent = ' Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:18.0) Gecko/20100101 Firefox/18.0' }
    page = agent.get('http://www.bsag.de/')
    
    page.links.each do |link|
      puts link.text
    end

    puts "nun noch die Haltestellen"
    puts self.start_station
    puts self.stop_station
  end
  
  
end

bsag = Bsag.new(ARGV[0], ARGV[1])
bsag.search_connection



