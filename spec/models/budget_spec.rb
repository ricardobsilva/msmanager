require 'rails_helper'

RSpec.describe Budget, type: :model do
  it { belong_to(:service_order) }
  it { belong_to(:service) }
end
