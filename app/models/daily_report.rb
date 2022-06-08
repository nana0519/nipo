class DailyReport < ApplicationRecord
  belongs_to :end_user
  belongs_to :company
  belongs_to :construction
  belongs_to :car
    
  has_many_attached :daily_report_images
end
