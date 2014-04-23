module AttendancesHelper

  DELIM = "\t"

  def mytime_str_to_arr str
    str.split(DELIM)
  end

  def mytime_arr_to_str arr
    arr.join(DELIM)
  end

end
