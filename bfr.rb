# "mabf" reloaded
# Kleines Skript um mal eben zu sehen welche Bahn/Bahn
# in den nächsten Minuten abfährt. 
require 'rubygems'
require 'nokogiri'
require 'mechanize'


class Bsag
  attr_accessor :start_station, :stop_station

  def initialize(start_station="Univers./Zentralbereich", stop_station="Hauptbahnhof")
    @start_station = start_station
    @stop_station = stop_station
  end

  def search_connection
    agent = Mechanize.new { |a| a.user_agent = ' Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:18.0) Gecko/20100101 Firefox/18.0' }
    page = agent.get('http://www.bsag.de/')
    
    #page.links.each do |link|
    #  puts link.text
    #end
    # page.forms[0] -> Suche
    # 
    form = page.forms[1]
    form.language = "de"
    form.sessionID = "0"
    form.useRealtime = "1"
    form.place_origin = "Bremen"
    form.place_destination = "Bremen"
    form.type_origin = "stop"
    form.type_destination = "stop"
    form.nameState_origin = "empty"
    form.nameState_destination = "empty"
    form.name_origin = "#{}UNIVERS./Zentralbereich"
    form.name_destination = "#{}HAUPTBAHNHOF"
    form.itdTimeHour = "#{Time.now.hour}" # als 9 
    form.itdTimeMinute = "#{Time.now.min}" # als 1
    form.itdDateDay = "#{Time::now.strftime("%d")}"
    form.itdDateMonth = "#{Time::now.strftime("%m")}"
    form.itdDateYear = "#{Time::now.strftime("%Y")}"
    form.itdTripDateTimeDepArr = "dep"

    page = agent.submit(form, form.buttons.first)

    pp page
  end
  
  
end

#ARGV[0], ARGV[1] ? 
bsag = Bsag.new()
bsag.search_connection



