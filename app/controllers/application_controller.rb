class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery
  before_filter :assign_nav_group

  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: lambda { |exception| render_error(500, exception, nil) }
    rescue_from ActionController::RoutingError, ActionController::UnknownController, ::AbstractController::ActionNotFound, ActiveRecord::RecordNotFound, with: lambda { |exception| render_error(404, exception, 'layouts/application') }
  end

  private

  def assign_nav_group
    group = request.path.split('/')
    if group[1] && nav_links_by_group.keys.include?(group[1].to_sym)
      @nav_group = group[1].to_sym
    else
     @nav_group = false
    end
  end

  def render_error(status, exception, layout)
    respond_to do |format|
      format.html { render template: "logistics/error_#{status}", layout: layout, status: status }
      format.all { render nothing: true, status: status }
    end
  end

end
