class Operation < ActiveRecord::Base
  attr_accessible :amount, :crop_id, :day, :depth, :month_id, :nh3, :no3_n, :operation_id, :org_n, :org_p, :po4_p, :type_id, :year
  #associations
  has_many :crops
  has_many :activities
  belongs_to :scenario
end
