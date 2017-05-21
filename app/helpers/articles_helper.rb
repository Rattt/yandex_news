module ArticlesHelper
  def humanized_datetime(datetime)
    return nil if datetime.nil?
    datetime.in_time_zone('Moscow').strftime('%Y-%m-%d %H:%M:%S')
  end
end
