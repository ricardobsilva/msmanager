class ServiceOrderMailer < ApplicationMailer
  default from: 'wilminhasilva@gmail.com'

  def notify_new_service_order
    @service_order = ServiceOrder.find(params[:service_order])
    
    mail(to: @service_order.vehicle.customer.email, subject: "Ordem de serviço")
  end
end