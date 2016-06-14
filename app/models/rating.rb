class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :client

  validates :score, inclusion: { in: 1..5 }, presence: true
  validates :user, presence: true
  validates :comment, presence: true
  
end
