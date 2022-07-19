class Car < ApplicationRecord
    has_many :daily_reports, dependent: :destroy
    
    validates :number, presence: true
end
