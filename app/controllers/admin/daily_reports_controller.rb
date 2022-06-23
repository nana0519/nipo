class Admin::DailyReportsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @daily_report = DailyReport.new
  end

  def create
    @daily_report = DailyReport.new(daily_report_params)
    if @daily_report.save
      redirect_to constructions_index_admin_constructions_path
    else
      render "new"
    end
  end

  def show
    @daily_report = DailyReport.find(params[:id])
  end
  
  def image
    daily_report = DailyReport.find(params[:id])
    @images = daily_report.daily_report_images
  end

  private

   def daily_report_params
    params.require(:daily_report).permit(:date, :end_user_id, :company_id, :construction_id, :car_id, daily_report_images: [])
   end
end
