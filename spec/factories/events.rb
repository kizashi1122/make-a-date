# -*- coding: utf-8 -*-
FactoryGirl.define do
  factory :event, :class => Event do
    name         '絢辻さん歓迎会'
    description  "bbb"
    plan_str     "1\n2\n3"
    plan         "1\t2\t3"
    url_param    "abc123"
  end
end

