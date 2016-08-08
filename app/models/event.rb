class Event
  RAILSBRIDGE_ORGANIZATION_ID = 1

  class << self
    def sorted_events(state = nil, options = {})
      events = (state == :upcoming) ? upcoming_events(options) : past_events(options)
      sort_by_starts_at(events)
    end

    private

    def of_type(type, options = {})
      events = begin
        fetch_json({type: type}.merge(options))
      rescue StandardError => e
        puts "Error fetching events from BridgeTroll: #{e.message}"
      end
      events || []
    end

    def upcoming_events(options = {})
      of_type('upcoming', options)
    end

    def past_events(options = {})
      of_type('past', options).select { |event| event['workshop'] }
    end

    def sort_by_starts_at(events)
      events.sort_by { |event| event['sessions'].first['starts_at'].to_time }
    end

    def fetch_json(options)
      uri = URI::parse(BRIDGETROLL_URL)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      response = http.send(:get, "/events.json?#{options.to_query}")
      JSON.parse(response.body)
    end
  end
end
