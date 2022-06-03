class ChangeColumnsAddNotnullOnDailyReports < ActiveRecord::Migration[6.1]
  def change
    change_column_null :daily_reports, :date, false
  end
end
