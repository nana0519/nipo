class CreateDailyReports < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_reports do |t|

      t.integer "end_user_id", null: false
      t.integer "company_id", null: false
      t.integer "construction_id", null: false
      t.integer "car_id", null: false
      t.integer "material_id", null: false
      

      t.timestamps
    end
  end
end
