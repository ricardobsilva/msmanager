class Vehicle < ApplicationRecord
  belongs_to :customer

  validates :year, :brand, :plate, :year, :chassis, presence: true
  validates :plate, uniqueness: true
end
