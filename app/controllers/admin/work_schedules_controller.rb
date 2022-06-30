class Admin::WorkSchedulesController < ApplicationController
  
  def index
    @months = DailyReport.pluck(:date).map{|date| date.strftime("%Y-%m")}.uniq
    @daily_reports = DailyReport.where("date like ?", "%#{@months.join("")}%")
  end
  
  def show
    @end_user = EndUser.find(params[:id])
  end
end
