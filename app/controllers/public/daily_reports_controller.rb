class Public::DailyReportsController < ApplicationController
  before_action :authenticate_end_user!
  
  def new
    @daily_report = DailyReport.new
  end
end
