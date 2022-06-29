class DailyReport < ApplicationRecord
  belongs_to :end_user
  belongs_to :company
  belongs_to :construction
  belongs_to :car
  belongs_to :work_schedule
    
  has_many_attached :daily_report_images
  
  enum weather: { 晴れ: 0, くもり: 1, 雨: 2, 雪: 3 }
end
