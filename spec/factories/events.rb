# -*- coding: utf-8 -*-
FactoryGirl.define do
  factory :event, :class => Event do
    name '絢辻さん歓迎会'
    description <<EOS
絢辻さん歓迎会
場所：塚田農場 梅田阪急東通り店
http://r.gnavi.co.jp/kagg500/

EOS
    plan_str <<EOS
2014/1/1 19:00-
2014/1/2 19:00-
2014/1/3 19:00-
2014/1/4 19:00-
none of the above

EOS
  end

  factory :plan, :class => Plan do
    datetime "2014/1/1 19:00"
    event
  end

end

