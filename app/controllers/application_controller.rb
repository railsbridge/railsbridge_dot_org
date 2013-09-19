class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery
  before_filter :assign_nav_group

  private

  def assign_nav_group
    group = request.path.split('/')
    if group[1] && nav_links_by_group.keys.include?(group[1].to_sym)
      @nav_group = group[1].to_sym
    else
     @nav_group = false
    end
  end

end
