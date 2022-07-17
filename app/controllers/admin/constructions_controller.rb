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

  def constructions_index
    @constructions = Construction.order(created_at: :desc).page(params[:page])
  end

  def end_users_index
    @construction = Construction.find(params[:id])
    @daily_reports = @construction.daily_reports.order(date: :desc).page(params[:page]).per(15)
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
    params.require(:construction).permit(:construction_name, :content, :contract, :address, :status)
  end

end
