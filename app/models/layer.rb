class Layer < ActiveRecord::Base
  attr_accessible :bulk_density, :clay, :depth, :organic_matter, :ph, :sand, :silt, :soil_id, :soil_p
  #associations
    belongs_to :soil
end
