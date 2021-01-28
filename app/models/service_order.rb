class ServiceOrder < ApplicationRecord
  validates :issue_reported, presence: true
  belongs_to :vehicle

  has_many :budgets, dependent: :destroy
  has_many :services, through: :budgets
  accepts_nested_attributes_for :budgets, allow_destroy: true , reject_if: :all_blank
end
