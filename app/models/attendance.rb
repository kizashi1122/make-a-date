class Attendance < ActiveRecord::Base
  belongs_to :plan
  belongs_to :user

  validates :status, presence: true
  validates :user_id, presence: true
  validates :plan_id, presence: true
end
