class Public::DailyReportsController < ApplicationController
  before_action :authenticate_end_user!
  
  def new
    @daily_report = DailyReport.new
    @work_schedule = WorkSchedule.where(end_user_id: current_end_user.id)
    @end_user = EndUser.where(id: current_end_user.id)
  end
  
  def create
    @daily_report = DailyReport.new(daily_report_params)
    # 勤務月と日報の日付の月が同じ場合のみデータを保存する
    daily_report_date = params[:daily_report][:date]
    work_schedule_id = params[:daily_report][:work_schedule_id]
    work_schedule_date = WorkSchedule.find(work_schedule_id).date
    daily_report_date = daily_report_date.delete("-").slice(0..5)
    work_schedule_date = work_schedule_date.to_s
    if daily_report_date == work_schedule_date
      if @daily_report.save
        redirect_to thank_you_daily_reports_path
      end
    else
      redirect_to  new_daily_report_path
      flash[:alert] = "勤務月と日付が同じ月になっていません。"
    end
  end
  
  private
  
  def daily_report_params
    params.require(:daily_report).permit(
    :work_schedule_id,
    :date,
    :end_user_id, 
    :company_id, 
    :construction_id,
    :car_id,
    :workers,
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
