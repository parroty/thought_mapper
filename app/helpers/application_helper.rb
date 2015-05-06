module ApplicationHelper
  def to_display_time(datetime)
    datetime.strftime("%Y/%m/%d %H:%M:%S") if datetime
  end
end
