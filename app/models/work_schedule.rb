class WorkSchedule < ApplicationRecord
  belongs_to :end_user
  has_many :daily_reports, dependent: :nullify
  
  validates :date, presence: true
end
