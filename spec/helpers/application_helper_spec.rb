require 'spec_helper'

describe ApplicationHelper do

  describe "#page_title" do

    it "returns the base title with no parameters" do
      helper.page_title.should eql("RailsBridge")
    end

    it "returns base title with pipe delimited pages when passed a string array - one element" do
      helper.page_title(["Section Name"]).should eql("RailsBridge | Section Name")
    end

    it "returns base title with pipe delimited pages when passed a string array - two elements" do
      helper.page_title(["Section Name", "Page Name"]).should eql("RailsBridge | Section Name | Page Name")
    end

  end

  describe "#nav_link" do

    it "returns a list element and link" do
      helper.nav_link("Overview", :learn).should eql('<li class=""><a href="/learn">Overview</a></li>')
    end

    it "returns a selected list element and link when is current page" do
      view.stub("current_page?").with(:learn).and_return(true)
      helper.nav_link("Overview", :learn).should eql('<li class="is-selected"><a href="/learn">Overview</a></li>')
    end

  end

end
