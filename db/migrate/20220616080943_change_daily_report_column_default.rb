class ChangeDailyReportColumnDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :daily_reports, :claim, nil
  end
end
