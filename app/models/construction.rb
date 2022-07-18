class Construction < ApplicationRecord
  has_many :daily_reports, dependent: :destroy
  
  validates :construction_name, presence: true
end
