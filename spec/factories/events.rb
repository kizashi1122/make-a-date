# -*- coding: utf-8 -*-
FactoryGirl.define do
  factory :event, :class => Event do
    name         "name"
    description  "description1\ndescription2"
    plan_str     "2014/1/3 19:00\n2014/1/4 19:00"
    plan         "2014/1/3 19:00\t2014/1/4 19:00"
    url_param    "abc123abc123abc123"
  end
end

