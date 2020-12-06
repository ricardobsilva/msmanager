class VehiclesController < ApplicationController
  before_action :set_customer, only: :new
  def create
  end

  def new
    @vehicle = Vehicle.new
  end

  private

  def set_customer
    @customers = Customer.all
  end
end
