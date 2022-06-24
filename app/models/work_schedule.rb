class WorkSchedule < ApplicationRecord
  has_many :end_users, dependent: :destroy
  has_many :daily_reports, dependent: :destroy
end
