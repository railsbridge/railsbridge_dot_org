class EventPresenter
  attr_reader :event

  def initialize(event)
    @event = event
  end

  def title
    event['title']
  end
  
  def url
    event['url']
  end

  def organization
    event['organization']
  end
  
  def external_event?
    url.present?
  end

  def organizers
    event['organizers'].kind_of?(Array) ? event['organizers'] : arrayify_string(event['organizers'] || '')
  end

  def event_url
    (external_event? && url) ? url : URI.join(BRIDGETROLL_URL, "/events/#{event['id']}").to_s
  end

  def signup_link
    return "RSVP on Bridge Troll" unless external_event?
    return "RSVP on Meetup" if url =~ /meetup.com/
    return "RSVP on Eventbrite" if url =~ /eventbrite.com/

    "Event Signup"
  end

  def valid_location?
    !external_event? && location.try(:[], 'address_1').present? && location.try(:[], 'city').present?
  end

  def location
    event['location']
  end

  def location_name
    location.try(:[], 'name')
  end

  def location_url
    valid_location? ? google_map_link : event_url
  end

  def location_city
    if location.present?
      external_event? ? location['city'] : "#{location['city']}, #{location['state']}"
    else
      "Location TBD"
    end
  end

  def event_dates(options = {})
    month_format = options[:short] ? '%b' : '%B'
    dates = []
    if start_date.to_date == end_date.to_date
      dates << start_date.strftime("#{month_format} %e, %Y")
    elsif start_date.month == end_date.month
      dates << start_date.strftime("#{month_format} %e")
      dates << end_date.strftime("%e, %Y")
    else
      dates << start_date.strftime("#{month_format} %e")
      dates << end_date.strftime("#{month_format} %e, %Y")
    end
    dates.join(' - ')
  end

  private

  def google_map_link
    base_url = "https://maps.google.com/?q="
    address_2 = location['address_2'] ? " #{location['address_2']}" : ""
    zip = location['zip'].present? ? ", #{location['zip']}" : ""
    address = "#{location['address_1']}#{address_2}, #{location['city']} #{location['state']}#{zip}"
    URI.encode(base_url + address)
  end

  def start_date
    DateTime.parse(event['sessions'].first['starts_at'])
  end

  def end_date
    DateTime.parse(event['sessions'].last['starts_at'])
  end

  def arrayify_string(str)
    str.split(/, &|&|,/).map{|x| x.strip || x }
  end

end
