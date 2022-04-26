class ServicesController < ApplicationController
  def create
    binding.pry
    @service = Service.new(service_params)
    if @service.save
      redirect_to service_path(@service), notice: 'Serviço criado com sucesso'

    else
      render :new
    end
  end

  def new
    @service = Service.new
  end

  private

  def service_params
    params.require(:service).permit(:name, :price, :description)
  end
end