class Admin::DailyReportsController < ApplicationController
  before_action :authenticate_admin!
  
  def new
    @daily_report = DailyReport.new
  end
  
  def create
    @daily_report = DailyReport.new(daily_report_params)
    if @daily_report.save
      redirect_to admin_daily_reports_path
    else
      render "new"
    end
  end
  
  private
  
   def daily_report_params
    params.require(:daily_report).permit(:daily_report_images, :end_user_id, :company_id, :construction_id)
   end
end
