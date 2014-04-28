# -*- coding: utf-8 -*-
require 'securerandom'

FactoryGirl.define do
  factory :event, :class => Event do
    name         "Party"
    description  "description1\ndescription2"
    plan_str     "2014/1/3 19:00\n2014/1/4 19:00"
    plan         "2014/1/3 19:00\t2014/1/4 19:00"
    url_param    SecureRandom.hex(16)
  end

  factory :attendance, :class => Attendance do
    sequence(:user_name)  { |n| "John Doe#{n}" }
    sequence(:comment)    { |n| "comment#{n}"  }
    mytime      "0\t0"
    mytime_arr  [0, 0]
    event
  end

  factory :event_with_atdc, :class => Event do
    name         "Party2"
    description  "description1\ndescription2"
    plan_str     "2014/1/3 19:00\n2014/1/4 19:00"
    plan         "2014/1/3 19:00\t2014/1/4 19:00"
    url_param    SecureRandom.hex(16)
    after(:create) { |event| 
          event.attendances = [
          FactoryGirl.create(:attendance, event: event),
          FactoryGirl.create(:attendance, event: event)
        ]
      }
  end

end

