class ActiveSupport::TimeWithZone
  def as_json(options = {})
    strftime('%Y-%m-%d %H:%M')
  end
end
