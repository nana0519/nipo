class Company < ApplicationRecord
  has_many :daily_reports, dependent: :destroy
  
  enum deadline: { "10日": 0, "15日": 1, "20日": 2, "25日": 3, 末日: 4, 都度: 5 }
  
  validates :company_name, presence: true
end
