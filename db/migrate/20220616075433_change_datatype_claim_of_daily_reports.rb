class ChangeDatatypeClaimOfDailyReports < ActiveRecord::Migration[6.1]
  def change
    change_column :daily_reports, :claim, :string
  end
end
