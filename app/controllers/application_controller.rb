class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :assign_nav_group

  @suppress_sidenav = false

  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: lambda { |exception| render_error(500, exception, nil) }
    rescue_from ActionController::RoutingError, ActionController::UnknownController, ::AbstractController::ActionNotFound, ActiveRecord::RecordNotFound, with: lambda { |exception| render_error(404, exception, 'layouts/application') }
  end

  private

  def render_error(status, exception, layout)
    respond_to do |format|
      format.html { render template: "logistics/error_#{status}", layout: layout, status: status }
      format.all { render nothing: true, status: status }
    end
  end

  def assign_nav_group
    # TODO More graceful solution for page not being in a group
    @nav_group = ''
    [:learn, :help, :about].each do |group|
      @nav_group = group if request.path.match(/^\/#{group}/)
    end
  end

end
