class Event < ActiveResource::Base
  self.site = BRIDGETROLL_URL
  self.element_name = "all_events"

  def self.sorted_events(state = nil)
    if state == :upcoming || state == :past
      end_of_day = (DateTime.now.end_of_day - 840.days)
      events = (state == :upcoming) ? upcoming_events(end_of_day) : past_events(end_of_day)
    else
      events = all
    end
    sort_by_starts_at(events)
  end

  private

  def self.upcoming_events(end_of_day)
    all.select { |event| DateTime.parse(event.sessions.last.starts_at) > end_of_day }
  end

  def self.past_events(end_of_day)
    all.select { |event| DateTime.parse(event.sessions.last.starts_at) < end_of_day }
  end

  def self.sort_by_starts_at(events)
    events.sort_by { |e| e.sessions.first.starts_at.to_time }
  end

end
