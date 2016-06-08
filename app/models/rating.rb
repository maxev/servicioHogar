class Rating < ActiveRecord::Base
  belongs_to :user

  validates :score, inclusion: { in: 1..5 }, presence: true
  validates :user, :comment, presence: true
end
