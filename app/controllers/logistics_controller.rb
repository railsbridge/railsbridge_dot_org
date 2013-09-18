class LogisticsController < ApplicationController

  def sitemap
  end

  def error_404
  end

  def error_500
    render layout: false
  end

end
