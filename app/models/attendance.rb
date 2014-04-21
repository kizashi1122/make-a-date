class Attendance < ActiveRecord::Base
#  belongs_to :plan
#  belongs_to :user
  belongs_to :event

#  validates :status, presence: true
#  validates :user_id, presence: true
#  validates :plan_id, presence: true
  validates :user_name, presence: true
  validates :mytime, presence: true
  validates :event_id, presence: true


end
