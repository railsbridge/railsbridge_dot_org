require 'spec_helper'

describe "Static pages" do

  describe "Home" do
    it "exists" do
      visit '/'
      status_code.should be 200
    end

    it "does not have a side nav" do
      visit '/'
      page.should_not have_selector 'side-nav'
    end

  end

  describe "About section" do

    it "has an overview page" do
      visit '/about'
      status_code.should be 200
    end

    it "has a team page" do
      visit '/about/team'
      status_code.should be 200
    end

    it "has a sponsors page" do
      visit '/about/sponsors'
      status_code.should be 200
    end

    it "has a chapters page" do
      visit '/about/chapters'
      status_code.should be 200
    end

    it "has a past events page" do
      visit '/about/past-events'
      status_code.should be 200
    end

    it "has a projects page" do
      visit '/about/projects'
      status_code.should be 200
    end

  end

  describe "Learn section" do

    it "has an overview page" do
      visit '/learn'
      status_code.should be 200
    end

    it "has an upcoming workshops page" do
      visit '/learn/events'
      status_code.should be 200
    end

    it "has a faq page" do
      visit '/learn/faq'
      status_code.should be 200
    end

    it "has a keep learning page" do
      visit '/learn/resources'
      status_code.should be 200
    end

  end

  describe "Help section" do

    it "has an overview page" do
      visit '/help'
      status_code.should be 200
    end

    it "has a teach page" do
      visit '/help/teach'
      status_code.should be 200
    end

    it "has a teacher page" do
      visit '/help/teacher-advice'
      status_code.should be 200
    end

    it "has an organize page" do
      visit '/help/organize'
      status_code.should be 200
    end

    it "has a host page" do
      visit '/help/host'
      status_code.should be 200
    end

    it "has a donor faq page" do
      visit '/help/donor-faq'
      status_code.should be 200
    end

    it "has an interest form page" do
      visit '/help/interest-form'
      status_code.should be 200
    end

  end

end
