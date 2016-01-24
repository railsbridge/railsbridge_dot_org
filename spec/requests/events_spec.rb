require 'spec_helper'
require 'active_resource'

describe "rendering events list" do
  def default_event_attributes(date)
    {
      workshop: true,
      location: {
        name: 'City Hall',
        city: 'San Francisco',
        state: 'California'
      },
      sessions: [
        {
          name: 'Good Session',
          starts_at: "#{date.year}-01-13T18:00:00.000-08:00",
          ends_at: "#{date.year}-01-13T21:00:00.000-08:00"
        }
      ],
      organizers: [
        'Alpha Beta',
        'Gamma Zeta'
      ],
      organization: 'RailsBridge'
    }
  end

  before do
    ActiveResource::HttpMock.respond_to do |mock|
      mock.get "/events.json?organization_id=1&type=past", {}, [
        default_event_attributes(2.years.ago).merge(
          id: 1,
          title: 'OlderBridge',
        ),
        default_event_attributes(1.year.ago).merge(
          id: 2,
          title: 'BygoneBridge',
        )
      ].to_json

      mock.get "/events.json?type=upcoming", {}, [
        default_event_attributes(1.year.from_now).merge(
          id: 3,
          title: 'CourtBridge',
        )
      ].to_json
    end
  end

  describe "the home page" do
    it 'has a list of upcoming events' do
      visit '/'
      expect(page).to have_content('CourtBridge')
    end
  end

  describe "the events page" do
    it 'has a list of upcoming events' do
      visit '/learn/events'
      expect(page).to have_content('CourtBridge')
    end
  end

  describe "the home page" do
    it 'has a list of past events' do
      visit '/about/past-events'
      expect(page.all('tbody tr').length).to eq(2)
    end
  end
end
