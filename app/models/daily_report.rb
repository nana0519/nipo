class DailyReport < ApplicationRecord
  has_many :end_users, dependent: :destroy
  has_many :companies, dependent: :destroy
  has_many :constructions, dependent: :destroy
    
  has_many_attached :daily_report_images
end
