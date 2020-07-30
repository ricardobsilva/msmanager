class Customer < ApplicationRecord
  validates :name, presence: true

  has_one :address, dependent: :destroy

  accepts_nested_attributes_for :address, reject_if: :all_blank
end
