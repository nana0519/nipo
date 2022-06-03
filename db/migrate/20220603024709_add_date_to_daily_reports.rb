class AddDateToDailyReports < ActiveRecord::Migration[6.1]
  def change
    add_column :daily_reports, :date, :date
  end
end
