module PastEventsHelper
  def formatted_past_event_date(event)
    if event.sessions.length == 1
      DateTime.parse(event.sessions.first.starts_at).strftime("%B %e, %Y")
    else
      start_date = DateTime.parse(event.sessions.first.starts_at)
      end_date = DateTime.parse(event.sessions.last.starts_at)

      if start_date.month == end_date.month
        "#{start_date.strftime("%B %e")} - #{end_date.strftime("%e, %Y")}"
      else
        "#{start_date.strftime("%b %e")} - #{end_date.strftime("%b %e, %Y")}"
      end
    end
  end
end
