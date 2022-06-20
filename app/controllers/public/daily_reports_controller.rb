class Public::DailyReportsController < ApplicationController
  before_action :authenticate_end_user!
  
  def new
    @daily_report = DailyReport.new
  end
  
  def create
    @daily_report = DailyReport.new(daily_report_params)
    if @daily_report.save
      redirect_to thank_you_daily_reports_path
    else
      render "new"
    end
  end
  
  private
  
  def daily_report_params
    params.require(:daily_report).permit(
    :date,
    :end_user_id, 
    :company_id, 
    :construction_id,
    :car_id,
    :weather,
    :content,
    :claim,
    :material,
    :purchase,
    :start_distance,
    :finish_distance,
    :toll,
    :overtime,
    :night_shift,
    :start_time,
    :finish_time,
    :comment
    )
  end
end
