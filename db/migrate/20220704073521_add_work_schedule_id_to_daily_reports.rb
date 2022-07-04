class AddWorkScheduleIdToDailyReports < ActiveRecord::Migration[6.1]
  def change
    add_column :daily_reports, :work_schedule_id, :integer
  end
end
