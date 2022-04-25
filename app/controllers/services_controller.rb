class ServicesController < ApplicationController
  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to service_path(@service), notice: 'Serviço criado com sucesso'

    else
      render :new
    end
  end

  private

  def service_params
    params.require(:service).permit(:name, :price, :description)
  end
end