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
    @check = DailyReport.find(params[:id])
    @daily_report = DailyReport.find(params[:id])
    @workers = @daily_report.workers
    unless @workers == nil
      @workers = @workers.split(/[[:blank:]]+/).map{|n| n.tr("０-９", "0-9")}
      temp = @workers.map{|n| n.delete("^0-9").to_i}.inject(:+)
      if temp == 0
        @number_of_people = @workers.length
      elsif @workers.empty? == false
        @number_of_people = @workers.length.to_i - 1 + temp.to_i
      end
    end
  end

  def image
    daily_report = DailyReport.find(params[:id])
    @images = daily_report.daily_report_images
  end
  
  def edit
    @daily_report = DailyReport.find(params[:id])
  end
  
  def update
    @check = DailyReport.find(params[:id])
    if @check.update(check_params)
      flash[:notice] = "更新しました。"
      redirect_to admin_root_path
    else
      render "show"
    end
    
    @daily_report = DailyReport.find(params[:id])
    if @daily_report.update(edit_daily_report_params)
      flash[:notice] = "更新しました。"
    end
  end

  private

   def daily_report_params
    params.require(:daily_report).permit(:date, :end_user_id, :company_id, :construction_id, :car_id, :work_schedule_id, daily_report_images: [])
   end
   
   def check_params
     params.require(:daily_report).permit(:check)
   end
   
   def edit_daily_report_params
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
    :comment,
    daily_report_images: []
    )
   end
   
end
