class CustomersController < ApplicationController

  before_action :set_customer, only: [:show, :update, :edit]

  def index 
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def edit 

  end  

  def create 
    @customer = Customer.new(customer_params)

    if @customer.save 
      redirect_to customers_path, notice: 'Client registered success'
    else
      render :new
    end
  end

  def update 
    if @customer.update(customer_params)
      redirect_to customers_path, notice: 'Cliente atualizado com sucesso!'
    else
      render :edit
    end
  end

  def show;  end
  
  private

  def customer_params
    params.require(:customer).permit(:name, :email, :phone, :avatar, :smoker)
  end

  def set_customer 
    @customer = Customer.find params[:id]
  end

end
