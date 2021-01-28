class Budget < ApplicationRecord
  belongs_to :service_order
  belongs_to :service
end
