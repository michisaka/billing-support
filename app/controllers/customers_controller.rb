class CustomersController < ApplicationController
  def index
    @customers = Customer.all.order(:furigana)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
    5.times{ @customer.students.build }

  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      flash[:success] = "#{@customer.name}を追加しました。"
      redirect_to @customer
    else
      render 'new'
    end
  end

  def edit
    @customer = Customer.find(params[:id])
    (5 - @customer.students.count).times { @customer.students.build }
  end

  def update
    p params
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(customer_params)
      flash[:success] = "#{@customer.name}を更新しました。"
      redirect_to @customer
    else
      (5 - @customer.students.count).times { @customer.students.build }
      render 'edit'
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :furigana, students_attributes: [:id, :name, :furigana])
  end

end
