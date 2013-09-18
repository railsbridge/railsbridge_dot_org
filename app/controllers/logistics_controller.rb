class LogisticsController < ApplicationController

  def sitemap
    @suppress_sidenav = true
  end

  def error_404
    @suppress_sidenav = true
  end

  def error_500
    @suppress_sidenav = true
    render layout: false
  end

end
