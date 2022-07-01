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
    @workers = @daily_report.workers
    unless @workers == nil
      @workers = @workers.split(/[[:blank:]]+/).map{|n| n.tr("０-９", "0-9")}
      temp = @workers.map{|n| n.delete("^0-9").to_i}.inject(:+)
      if temp == 0
        @number_of_people = @workers.length
      else
        @number_of_people = @workers.length.to_i - 1 + temp.to_i
      end
    end
  end

  def image
    daily_report = DailyReport.find(params[:id])
    @images = daily_report.daily_report_images
  end

  def end_users_index
    months = DailyReport.pluck(:date).map{|date| date.strftime("%Y-%m")}.uniq
     @daily_reports = months.each do |month|
                       DailyReport.where("date like ?", "%#{month}%")
                      end
  end

  private

   def daily_report_params
    params.require(:daily_report).permit(:date, :end_user_id, :company_id, :construction_id, :car_id, daily_report_images: [])
   end
end
