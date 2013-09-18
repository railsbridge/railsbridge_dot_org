class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :assign_nav_group, :assign_suppress_sidenav

  private

  def assign_nav_group
    # TODO More graceful solution for page not being in a group
    @nav_group = false
    [:learn, :help, :about].each do |group|
      @nav_group = group if request.path.match(/^\/#{group}/)
    end
  end

  def assign_suppress_sidenav(suppress = true)
    @suppress_sidenav = suppress
  end

end
