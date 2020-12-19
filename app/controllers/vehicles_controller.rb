class VehiclesController < ApplicationController
  before_action :set_customer, only: [:new, :create, :edit]

  def create
    @vehicle = Vehicle.new(vehicle_params)

    if @vehicle.save
      redirect_to edit_vehicle_path(@vehicle)
    else
      render :new
    end
  end

  def index
    @vehicles = Vehicle.all
  end

  def new
    @vehicle = Vehicle.new
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def update
    @vehicle = Vehicle.find(params[:id])

    if @vehicle.update(vehicle_params)
      redirect_to edit_vehicle_path(@vehicle), notice: 'Veículo atualizado com sucesso'
    else
      render :edit
    end
  end

  def destroy
    Vehicle.find(params[:id]).destroy
    redirect_to vehicles_path, notice: 'Veículo removido com sucesso'
  end

  private

  def set_customer
    @customers = Customer.all
  end

  def vehicle_params
    params.require(:vehicle).permit(:plate, :year, :chassis, :model, :brand, :customer_id)
  end
end
