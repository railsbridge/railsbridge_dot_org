require 'spec_helper'

describe LogisticsController do

  describe "GET 'error_404'" do
    it "returns http success" do
      visit '/404'
      response.should be_success
    end
  end

  describe "GET 'error_500'" do
    it "returns http success" do
      visit '/500'
      response.should be_success
    end
  end

  describe "GET 'sitemap'" do
    it "returns http success" do
      visit '/sitemap'
      response.should be_success
    end
  end

end
