class ServiceOrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_customer, only: [:new, :edit]

  def index
    @service_orders = ServiceOrder.all
  end

  def new
    @service_order = ServiceOrder.new
  end

  def edit
    @service_order = ServiceOrder.find(params[:id])
  end

  def create
    @service_order = ServiceOrder.new(service_order_params)

    if @service_order.save
      redirect_to service_order_path(@service_order), notice: 'Ordem de Serviço criada com sucesso'
    else
      render :new
    end
  end

  def show
    @service_order = ServiceOrder.find(params[:id])
  end

  def print_service_order
  end

  def set_customer
    @customers = Customer.all
  end

  private

  def service_order_params
    params.require(:service_order).permit(
      :protocol_number,
      :issue_reported,
      :observation,
      :customer_id
    )
  end
end
