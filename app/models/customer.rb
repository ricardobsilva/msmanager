class Customer < ApplicationRecord
  validates :name, :email, :cnpj_cpf, :phone_number, presence: true
  validates :cnpj_cpf, uniqueness: true

  has_one :address, dependent: :destroy
  has_many :vehicles,  dependent: :destroy

  accepts_nested_attributes_for :address, reject_if: :all_blank
end
