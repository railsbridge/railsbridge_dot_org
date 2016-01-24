require 'active_resource'

class Event < ActiveResource::Base
  RAILSBRIDGE_ORGANIZATION_ID = 1

  self.site = BRIDGETROLL_URL
  self.element_name = "events"
  self.timeout = 10

  def self.sorted_events(state = nil, options = {})
    events = (state == :upcoming) ? upcoming_events(options) : past_events(options)
    sort_by_starts_at(events)
  end

  private

  def self.of_type(type, options = {})
    events = begin
      where({type: type}.merge(options))
    rescue StandardError => e
      puts "Error fetching events from BridgeTroll: #{e.message}"
    end
    events || []
  end

  def self.upcoming_events(options = {})
    of_type('upcoming', options)
  end

  def self.past_events(options = {})
    of_type('past', options).select { |event| event.workshop }
  end

  def self.sort_by_starts_at(events)
    events.sort_by { |event| event.sessions.first.starts_at.to_time }
  end
end
