class EventPresenter < BasePresenter
  presents :event

  def external_event?
    event.respond_to?(:url)
  end

  def organizers
    organizers = event.organizers.kind_of?(Array) ? event.organizers : arrayify_string(event.organizers || '')
  end

  def event_url
    external_event? && event.url ? event.url : "#{BRIDGETROLL_URL}events/#{event.id}"
  end

  def signup_link
    case
    when !external_event? then "RSVP on Bridge Troll"
    when event.url =~ /meetup.com/ then "RSVP on Meetup"
    when event.url =~ /eventbrite.com/ then "RSVP on Eventbrite"
    else "Event Signup"
    end
  end

  def valid_location?
    !event.external_event? && event.location.respond_to?(:address_1) && event.location.respond_to?(:city)
  end

  def location_url
    valid_location? ? google_map_link : event_url
  end

  def location_city
    if event.location
      external_event? ? event.location.city : "#{event.location.city}, #{event.location.state}"
    else
      "Location TBD"
    end
  end

  def event_dates
    "#{start_date.strftime('%B %e')} - #{end_date.strftime('%B %e, %Y')}"
  end

  def event_dates_short_form
    dates = []
    if start_date.to_date == end_date.to_date
      dates << start_date.strftime('%b %e, %Y')
    elsif start_date.month == end_date.month
      dates << start_date.strftime('%b %e') << end_date.strftime('%e, %Y')
    else
      dates << start_date.strftime('%b %e') << end_date.strftime('%b %e, %Y')
    end
    dates.join(' - ')
  end

  private

  def google_map_link
    base_url = "https://maps.google.com/?q="
    address_2 = event.location.address_2 ? " #{event.location.address_2}" : ""
    zip = event.location.zip ? ", #{event.location.zip}" : ""
    address = "#{event.location.address_1}#{address_2}, #{event.location.city} #{event.location.state}#{zip}"
    URI.encode(base_url + address)
  end

  def start_date
    DateTime.parse(event.sessions.first.starts_at)
  end

  def end_date
    DateTime.parse(event.sessions.last.starts_at)
  end

  def arrayify_string(str)
    str.split(/, &|&|,/).map{|x| x.strip || x }
  end

end
