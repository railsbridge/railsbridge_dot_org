class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_header
  
  def set_header
    @header = true
  end
end
