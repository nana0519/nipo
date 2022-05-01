class Role < ApplicationRecord
  has_many :admins
  has_many :end_users
  
  validates :name, presence: true
end
