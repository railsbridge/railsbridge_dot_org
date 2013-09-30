class PastEvent < ActiveResource::Base
  self.site = BRIDGETROLL_URL

  def self.upcoming_events
    end_of_today = DateTime.now.end_of_day
    all.select do |event|
      DateTime.parse(event.sessions.last.starts_at) > end_of_today
    end
  end
end
