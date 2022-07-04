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
    @work_schedules = WorkSchedule.all
  end
  
  def show
    @work_schedule = WorkSchedule.find(params[:id])
  end
  
  private
  
  def work_schedule_params
    params.require(:work_schedule).permit(:date, :end_user_id)
  end
end
