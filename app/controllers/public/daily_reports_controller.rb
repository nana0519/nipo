class Public::DailyReportsController < ApplicationController
  before_action :authenticate_end_user!
end
