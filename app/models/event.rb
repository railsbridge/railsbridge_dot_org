require 'active_resource'

class Event < ActiveResource::Base
  self.site = BRIDGETROLL_URL
  self.element_name = "events"
  self.timeout = 10

  def self.sorted_events(state = nil)
    events = (state == :upcoming) ? upcoming_events : past_events
    sort_by_starts_at(events)
  end

  private

  def self.of_type(type)
    events = begin
      where(type: type)
    rescue StandardError => e
      puts "Error fetching events from BridgeTroll: #{e.message}"
    end
    events || []
  end

  def self.upcoming_events
    of_type('upcoming')
  end

  def self.past_events
    of_type('past').select { |event| event.workshop }
  end

  def self.sort_by_starts_at(events)
    events.sort_by { |event| event.sessions.first.starts_at.to_time }
  end
end
