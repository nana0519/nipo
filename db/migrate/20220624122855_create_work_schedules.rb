class CreateWorkSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :work_schedules do |t|
      
      t.integer "end_user_id", null: false
      t.integer "daily_report_id", null: false

      t.timestamps
    end
  end
end
