class ServiceOrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @service_orders = ServiceOrder.all
  end

  def print_service_order
  end
end
