module EventsHelper
  def bridgetroll_event_url(event)
    "#{BRIDGETROLL_URL}events/#{event.id}"
  end

  def formatted_event_date(event)
    [
      DateTime.parse(event.sessions.first.starts_at).strftime("%B %e"),
      DateTime.parse(event.sessions.last.ends_at).strftime("%B %e, %Y")
    ].join(' - ')
  end

  def valid_location?(location)
    location.address_1 && location.city
  end

  def location_name(location)
    location.name ||= "#{location.address_1}, #{location.city}"
  end

  def location_url(location)
    base_url = "https://maps.google.com/?q="
    address_2 = location.address_2 ? " #{location.address_2}" : ""
    zip = location.zip ? ", #{location.zip}" : ""
    address = "#{location.address_1}#{address_2}, #{location.city} #{location.state}#{zip}"
    URI::encode(base_url + address)
  end
end
