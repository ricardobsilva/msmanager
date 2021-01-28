class ServiceOrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vehicle, except: :index
  before_action :set_service, except: :index
  before_action :set_budgets, except: :index

  def index
    @service_orders = ServiceOrder.includes(:vehicle).order(created_at: :asc)
  end

  def new
    @service_order = ServiceOrder.new(protocol_number: "#{rand(200..900)}#{rand(700..900)}")
    @budget ||= Budget.new
  end

  def edit
    @service_order = ServiceOrder.find(params[:id])
    @budget ||= Budget.new
  end

  def update
    @service_order = ServiceOrder.find(params[:id])

    if @service_order.update(service_order_params.except(:protocol_number))
      redirect_to service_order_path(@service_order)
    else
      render :edit
    end
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
    @service_order = ServiceOrder.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf do
        render template: 'service_orders/print_service_order', pdf: 'OS'  # Excluding ".pdf" extension.
      end
    end
  end

  private

  def set_vehicle
    @vehicles = Vehicle.all.collect do |vehicle|
      ["#{vehicle.plate} - #{vehicle.customer.name} (#{vehicle.customer.cnpj_cpf})", vehicle.id]
    end
  end

  def set_service
    @services = Service.all.collect { |s| [s.name, s.id] }
  end

  def set_budgets
    @budgets = ServiceOrder.find(params[:id]).budgets.includes(:service)
  end

  def service_order_params
    params.require(:service_order).permit(
      :protocol_number,
      :issue_reported,
      :observation,
      :vehicle_id,
      budgets_attributes: [:id, :_destroy, :service_id, :price]
    )
  end
end