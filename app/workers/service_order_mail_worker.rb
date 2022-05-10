class ServiceOrderMailWorker
  include Sidekiq::Job
  queue_as :default
  sidekiq_options retry: false

  def perform(service_order_id)
    service_order = ServiceOrder.find(service_order_id)
    ServiceOrderMailer.with(service_order: service_order.id).notify_new_service_order.deliver_now
  end
end