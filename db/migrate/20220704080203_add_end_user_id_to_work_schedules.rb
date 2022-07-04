class AddEndUserIdToWorkSchedules < ActiveRecord::Migration[6.1]
  def change
    add_column :work_schedules, :end_user_id, :integer
  end
end
