require 'spec_helper'

def find_routes
  Rails.application.routes.routes.select do |route|
    route.defaults[:controller] == 'static_pages'
  end
end

describe "Static pages" do
  before do
    stub_request(:get, /#{BRIDGETROLL_URL}\/events.json.*/).
      to_return(status: 200, body: "[]")
  end

  it 'can render a bunch of static pages' do
    # sanity check that find_routes isn't returning nothing
    find_routes.length.should be > 10
  end

  find_routes.each do |route|
    route_string = route.path.spec.to_s.gsub(/\(.*?\)/, '')

    it "renders #{route_string} successfully" do
      visit route_string
      status_code.should be 200
    end
  end
end
