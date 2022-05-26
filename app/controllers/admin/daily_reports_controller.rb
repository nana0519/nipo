class Admin::DailyReportsController < ApplicationController
  
  def new
    @daily_report = DailyReport.new
  end
end
