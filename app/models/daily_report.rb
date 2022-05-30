class DailyReport < ApplicationRecord
  has_many :end_users, dependent: :destroy
  has_many :companies, dependent: :destroy
  has_many :constructions, dependent: :destroy
    
  has_many_attached :daily_report_images
  
  def save_daily_report(new_end_user, new_company, new_construction)
    self.end_users << new_end_user
    self.companies << new_company
    self.constructions << new_construction
  end
end
