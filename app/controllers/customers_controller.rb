class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to @customer
    else
      render :new
    end
  end

  private

  def customer_params
    params.require(:customer).permit(
      :name,
      :email,
      :cnpj_cpf,
      :phone_number,
      :second_phone_number,
      :cpf_cnpj
    )
  end
end
