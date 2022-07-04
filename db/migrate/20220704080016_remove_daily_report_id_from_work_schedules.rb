class RemoveDailyReportIdFromWorkSchedules < ActiveRecord::Migration[6.1]
  def change
    remove_column :work_schedules, :daily_report_id, :integer
  end
end
