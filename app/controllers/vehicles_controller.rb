class VehiclesController < ApplicationController
  before_action :set_customer, only: [:new, :create]

  def create
    @vehicle = Vehicle.new(vehicle_params)

    if @vehicle.save
      redirect_to vehicle_path(@vehicle)
    else
      render :new
    end
  end

  def new
    @vehicle = Vehicle.new
  end

  def show
  end

  private

  def set_customer
    @customers = Customer.all
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:plate, :year, :chassis, :model, :brand, :customer_id)
  end
end
