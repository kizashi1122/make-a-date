module ApplicationHelper

  def display_status code
    ['Not OK', 'Maybe', 'Ok!'][code - 1]
  end

end
