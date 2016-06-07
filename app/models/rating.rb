class Rating < ActiveRecord::Base
  belongs_to :user

  validates :score, inclusion: { in: 1..5 }, presence: true
  validates :comment, precense: true
end
