require 'spec_helper'

describe LogisticsController do

  describe "GET 'error_404'" do
    before do
      Rails.application.config.consider_all_requests_local = false
      RailsbridgeSite2013::Application.reload_routes!
    end

    it "returns http success" do
      request.stub(:local?) { true }
      visit '/404'
      response.should be_success
    end

    after do
      Rails.application.config.consider_all_requests_local = true
      RailsbridgeSite2013::Application.reload_routes!
    end
  end

  describe "GET 'sitemap'" do
    it "returns http success" do
      visit '/sitemap'
      response.should be_success
    end
  end

end
