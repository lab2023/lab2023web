class Admins::CustomersController < Admins::ApplicationController
  def index
    @customers = Customer.paginate(:page => params[:page])
    respond_with(:admins, @customers)
  end

  def show
    @customer = Customer.find(params[:id])
    respond_with(@customer)
  end

  def new
    @customer = Customer.new
    respond_with(:admins, @customer)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def create
    @customer = Customer.new(params[:customer])
    @customer.save
    respond_with(:admins, @customer)
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update_attributes(params[:customer])
    respond_with(:admins, @customer)
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    respond_with(:admins, @customer)
  end
end
