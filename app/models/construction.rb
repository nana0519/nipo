class Construction < ApplicationRecord
  has_many :daily_reports, dependent: :destroy
end
