class Weather < ActiveRecord::Base
  attr_accessible :field_id, :latitude, :longitude, :simulation_final_year, :simulation_initial_year, :station_id, :station_way, :weather_file, :way_id
  #Associations
    has_one :way
    has_one :station
    belongs_to :field
end
