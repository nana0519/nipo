class Admin::ConstructionsController < ApplicationController
  before_action :authenticate_admin!
  
  def new
    @construction = Construction.new
  end
  
  def create
    @construction = Construction.new(construction_params)
    if @construction.save
      redirect_to admin_constructions_path
    else
      render "new"
    end
  end
  
  def index
    @constructions = Construction.page(params[:page])
  end
  
  def show
    @construction = Construction.find(params[:id])
  end
  
  def edit
    @construction = Construction.find(params[:id])
  end
  
  def update
    @construction = Construction.find(params[:id])
    if @construction.update(construction_params)
      redirect_to admin_construction_path(@construction)
    else
      render "edit"
    end
  end
  
  private

  def construction_params
    params.require(:construction).permit(:name, :content, :contract, :address)
  end
  
end
