module EventsHelper

  DELIM = "\t"
  def event_plan_str_to_arr str
    str.split(DELIM)
  end
  def event_plan_arr_to_str arr
    arr.join(DELIM)
  end

  def show_status_icon status
    icon_type = "question-sign"
    color = "gray"
    if status == 0
      icon_type = "remove-sign"
      color = "red"
    elsif status == 1
      # use default
    elsif status == 2
      icon_type = "ok-sign"
      color = "green"
    end
      content_tag(:span, "", :class => "glyphicon glyphicon-" + icon_type, :style =>"color:" + color)
  end

end
