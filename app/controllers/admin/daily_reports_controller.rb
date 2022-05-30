class Admin::DailyReportsController < ApplicationController
  before_action :authenticate_admin!
  
  def new
    @daily_report = DailyReport.new
  end
  
  def create
    @daily_report = DailyReport.new(daily_report_params)
    new_end_user = params[:daily_report][:end_user_id]
    new_company = params[:daily_report][:company_id]
    new_construction = params[:daily_report][:construction_id]
    @daily_report.admin_id = current_admin.id
    if @daily_report.update
      @daily_report.save_daily_report(new_end_user, new_company, new_construction)
      redirect_to admin_daily_reports_path
    end
  end
  
  private
  
  def daily_report_params
    params.require(:daily_report).permit(:daily_report_images, :end_user_id, :company_id, :construction_id)
  end
end
