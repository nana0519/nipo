class AddColumnWorkSchedule < ActiveRecord::Migration[6.1]
  def change
    add_column :work_schedules, :date, :date
  end
end
