class AddCheckToDailyReports < ActiveRecord::Migration[6.1]
  def change
    add_column :daily_reports, :check, :boolean, default: false
  end
end
