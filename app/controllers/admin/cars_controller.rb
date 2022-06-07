class Admin::CarsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to admin_cars_path
    else
      render "new"
    end
  end
  
  def index
    @cars = Car.page(params[:page])
  end
  
  def edit
    @car = Car.find(params[:id])
  end
  
  def update
    @car = Car.find(params[:id])
    if @car.update(car_params)
      redirect_to admin_cars_path
    else
      render "edit"
    end
  end

  private

  def car_params
    params.require(:car).permit(:number, :use)
  end
end
