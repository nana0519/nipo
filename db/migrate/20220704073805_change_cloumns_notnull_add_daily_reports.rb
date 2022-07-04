class ChangeCloumnsNotnullAddDailyReports < ActiveRecord::Migration[6.1]
  def change
    change_column_null :daily_reports, :work_schedule_id, false
  end
end
