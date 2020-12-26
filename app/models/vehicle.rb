class Vehicle < ApplicationRecord
  belongs_to :customer
  has_many :service_orders
  
  validates :year, :brand, :plate, :year, :chassis, presence: true
  validates :plate, uniqueness: true
end
