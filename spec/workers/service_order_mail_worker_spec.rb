require 'rails_helper'

RSpec.describe ServiceOrderMailWorker do
  describe 'envio de email' do
    it 'Quando criado uma ordem de serviço' do
      customer = create(:customer)
      vehicle = create(:vehicle, customer: customer)
      service_order = create(:service_order, vehicle: vehicle)
      user = create(:user)
      
      mail_worker = ServiceOrderMailWorker.new.perform(service_order.id)
      
      expect(ActionMailer::Base.deliveries.count).to eq(1)
    end
  end
end