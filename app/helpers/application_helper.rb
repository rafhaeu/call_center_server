module ApplicationHelper
  def format_datetime(datetime)
    year = datetime.year
    month = datetime.month
    day = datetime.day
    "#{year}-#{month}-#{day} #{datetime.strftime('%H:%M')}"
  end

  def calltype_icon(calltype)
    styles = calltype_styling(calltype)
    "<span style='color: #{styles[:color]}' class='glyphicon glyphicon-log-#{styles[:glyphicon]}'></span>"
  end

  def calltype_styling(calltype)
    if calltype == 1
      {color: "green", glyphicon: "in"}
    elsif calltype == 2
      {color: "red", glyphicon: "out"}
    end
  end
end
