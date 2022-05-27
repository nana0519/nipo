class Admin::DailyReportsController < ApplicationController
  
  def new
    @daily_report = DailyReport.new
  end
  
  def create
    @daily_report = DailyReport.new(daily_report_params)
  end
  
  private
  
  def daily_report_params
    params.require(:daily_report).permit(:daily_report_images, :end_user_id, :company_id, :construction_id)
  end
end
