
class Plan < ActiveRecord::Base
  belongs_to :event
  has_many :attendances

  validates :datetime, presence: true
  validates :event_id, presence: true
end
