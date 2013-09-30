module EventsHelper
  def bridgetroll_event_url(event_id)
    "#{BRIDGETROLL_URL}events/#{event_id}"
  end

  def event_dates(start_date, end_date)
    [
      DateTime.parse(start_date).strftime("%B %e"),
      DateTime.parse(end_date).strftime("%B %e, %Y")
    ].join(' - ')
  end

  def event_dates_short(start_date, end_date)
    start_date = DateTime.parse(start_date)
    end_date = DateTime.parse(end_date)

    if start_date == end_date
      start_date.strftime("%B %e, %Y")
    elsif start_date.month == end_date.month
      "#{start_date.strftime("%B %e")} - #{end_date.strftime("%e, %Y")}"
    else
      "#{start_date.strftime("%b %e")} - #{end_date.strftime("%b %e, %Y")}"
    end
  end

  def upcoming_past_event_cta(event_url)
    case
    when event_url =~ /meetup.com/ then "RSVP on Meetup"
    when event_url =~ /eventbrite.com/ then "RSVP on Eventbrite"
    else "Event Information"
    end
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
    URI.encode(base_url + address)
  end

end
