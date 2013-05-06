class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :display_breadcrumbs
  
  protected
  
  def display_breadcrumbs
    true
  end
end
