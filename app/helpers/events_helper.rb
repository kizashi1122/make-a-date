# -*- coding: utf-8 -*-
module EventsHelper

  DELIM = "\t"
  def event_plan_str_to_arr str
    str.split(DELIM)
  end
  def event_plan_arr_to_str arr
    arr.join(DELIM)
  end

end
