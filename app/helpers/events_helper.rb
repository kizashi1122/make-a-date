# -*- coding: utf-8 -*-
module EventsHelper

  DELIM = "\t"
  def event_plan_str_to_arr str
    str.split(DELIM)
  end
  def event_plan_arr_to_str arr
    arr.join(DELIM)
  end

  def show_status_icon status
    icon_type = "question"
    color = "gray"
    title = "まだわかりません"

    if status == 0
      icon_type = "times"
      color = "tomato"
      title = "行けません"
    elsif status == 1
      # use default
    elsif status == 2
      icon_type = "check"
      color = "green"
      title = "行けます！"
    end
#      content_tag(:span, "", :class => "glyphicon glyphicon-" + icon_type, :style =>"color:" + color)
    content_tag(:i, "", :class => "fa fa-" + icon_type + "-circle", :style =>"color:" + color, :title => title)
  end

end
