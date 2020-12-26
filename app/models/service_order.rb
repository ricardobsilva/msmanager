class ServiceOrder < ApplicationRecord
  validates :issue_reported, presence: true
  belongs_to :vehicle
end
