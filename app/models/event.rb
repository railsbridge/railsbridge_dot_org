require 'active_resource'

class Event < ActiveResource::Base
  self.site = BRIDGETROLL_URL
  self.element_name = "events/all_events"

  def self.sorted_events(state = nil)
    if state == :upcoming || state == :past
      end_of_day = DateTime.now.end_of_day
      events = (state == :upcoming) ? upcoming_events(end_of_day) : past_events(end_of_day)
    else
      events = all_events
    end
    sort_by_starts_at(events)
  end

  private

  def self.all_events
    events = begin
      all
    rescue StandardError => e
      puts "Error fetching events from BridgeTroll: #{e.message}"
    end
    events || []
  end

  def self.upcoming_events(end_of_day)
    all_events.select { |event| DateTime.parse(event.sessions.last.starts_at) > end_of_day }
  end

  def self.past_events(end_of_day)
    all_events.select do |event|
      DateTime.parse(event.sessions.last.starts_at) < end_of_day
    end.select do |event|
      event.workshop
    end
  end

  def self.sort_by_starts_at(events)
    events.sort_by { |event| event.sessions.first.starts_at.to_time }
  end

end
