class Event < ActiveRecord::Base
  has_many :attendances

  attr_accessor :plan_str

  validates :name, presence: true
  validates_presence_of :plan_str, on: :create

end
