class ChangeDatatypeDateOfWorkSchedules < ActiveRecord::Migration[6.1]
  def change
    change_column :work_schedules, :date, :integer, null: false
  end
end
