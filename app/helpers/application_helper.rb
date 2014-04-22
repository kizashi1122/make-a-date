module ApplicationHelper

  def display_status status
    ['Not OK', 'Maybe', 'Ok!'][status]
  end
end
