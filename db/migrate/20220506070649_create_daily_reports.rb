class CreateDailyReports < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_reports do |t|

      t.integer "end_user_id", null: false
      t.integer "company_id", null: false
      t.integer "construction_id", null: false
      t.integer "car_id"
      t.string "material"
      t.boolean :claim, default: true
      t.string "purchase"
      t.integer "price"
      t.integer "weather"
      t.string "workers"
      t.integer "overtime"
      t.text "content"
      t.integer "toll"
      t.float "start_distance"
      t.float "finish_distance"
      t.text "comment"
      t.time "start_time"
      t.time "finish_time"
      t.boolean "night_shift", default: false
      
      t.timestamps
    end
  end
end
