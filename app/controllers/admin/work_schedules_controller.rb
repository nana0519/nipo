class Admin::WorkSchedulesController < ApplicationController
  
  def new
    @work_schedule = WorkSchedule.new
  end
  
  def create
    @work_schedule = WorkSchedule.new(work_schedule_params)
    if @work_schedule.save
      redirect_to admin_work_schedules_path
    else
      render "new"
    end
  end
  
  def index
    @work_schedules = WorkSchedule.order(date: "DESC").page(params[:page]).per(20)
  end
  
  def show
    @work_schedule = WorkSchedule.find(params[:id])
    @daily_reports = @work_schedule.daily_reports
    year = @work_schedule.date.to_s[0..3].to_i 
    month = @work_schedule.date.to_s[4..5].to_i
    @dates = Date.new(year,month).all_month
  end
  
  private
  
  def work_schedule_params
    params.require(:work_schedule).permit(:date, :end_user_id)
  end
end
