class User < ActiveRecord::Base
  belongs_to :event
  has_many :attendances

  accepts_nested_attributes_for :attendances

  validates :name, presence: true
  validates :event_id, presence: true
end
