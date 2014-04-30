# -*- coding: utf-8 -*-
module ApplicationHelper

  def display_status status
#    ['Not OK', 'Maybe', 'Ok!'][status]
    ['×', '△', '◯'][status]
  end

end
