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
end
