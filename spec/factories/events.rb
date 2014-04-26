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
end

