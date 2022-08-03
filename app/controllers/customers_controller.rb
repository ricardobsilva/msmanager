class CustomersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:validate_email, :validate_cnpj_cpf]

  def index
    @customers = Customer.paginate(page: params[:page],per_page: 10)
  end

  def new
    @customer = Customer.new
    @customer.address ||= Address.new
  end

  def edit
    @customer = Customer.find(params[:id])
    @customer.address ||= Address.new
  end

  def update
    @customer = Customer.find(params[:id])

    if @customer.update(customer_params)
      redirect_to edit_customer_path(@customer), notice: t('notices.customer.message')
    else
      render :edit
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to customer_path(@customer), notice: 'Cliente criado com sucesso'
    else
      render :new
    end
  end

  def destroy
    Customer.find(params[:id]).destroy!

    redirect_to customers_path, notice: 'Cliente deletado com sucesso'
  end

  def validate_email
    body_response = Customer.where(email: params_to_validate[:email])

    render json: {avaiable: body_response.empty? } , status: :ok
  end

  def validate_cnpj_cpf
    body_response = Customer.where(cnpj_cpf: params_to_validate[:cnpj_cpf])

    render json: {avaiable: body_response.empty? }, status: :ok
  end

  private

  def customer_params
    params.require(:customer).permit(
      :name,
      :email,
      :cnpj_cpf,
      :phone_number,
      :second_phone_number,
      :cpf_cnpj,
      address_attributes: [:id, :cep, :street, :number, :complement, :neighborhood, :city]
    )
  end

  def params_to_validate
    params.require(:validate).permit(:email, :cnpj_cpf)
  end
end
