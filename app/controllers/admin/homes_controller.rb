class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
    @daily_reports = DailyReport.where(check: false)
    @daily_reports = @daily_reports.order(date: "DESC").page(params[:page])
  end
end
