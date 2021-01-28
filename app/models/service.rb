class Service < ApplicationRecord
  validates :name, :price, presence: true

  has_many :budgets
  has_many :service_orders, through: :budgets
end
