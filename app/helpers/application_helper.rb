module ApplicationHelper
  def format_datetime(datetime)
    year = datetime.year
    month = datetime.month
    day = datetime.day
    "#{year}-#{month}-#{day} #{datetime.strftime('%H:%M')}"
  end

  def calltype_icon(calltype)
    styles = calltype_styling(calltype)
    "<span style='color: #{styles[:color]}' class='glyphicon glyphicon-#{styles[:glyphicon]}'></span>"
  end

  def calltype_styling(calltype)
    if calltype == 1
      {color: "green", glyphicon: "log-in"}
    elsif calltype == 2
      {color: "red", glyphicon: "log-out"}
    else
      {color: "#2669c2", glyphicon: "share-alt"}
    end
  end
end
