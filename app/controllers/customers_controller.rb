class CustomersController < ApplicationController

  before_action :set_customer, only: [:show]

  def index 
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create 
    @customer = Customer.new(customer_params)

    if @customer.save 
      redirect_to customers_path, notice: 'Client registered success'
    else
      render :new
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
