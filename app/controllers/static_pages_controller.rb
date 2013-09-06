class StaticPagesController < ApplicationController
  @suppress_sidenav = false

  def home
    @suppress_sidenav = true
    @events = Event.all
  end

  def about
  end

  def learn
    @events = Event.all
  end

  def teach
  end

  def teacher_advice
  end

  def organize
  end

  def host
  end

  def faq
  end

  def projects
  end

  def learning_resources
  end

  def chapters
  end

  def events
    @events = Event.all
  end

  def past_events
    @past_events = PastEvent.all
  end

  def team
  end

  def sponsors
  end

  def help
  end

  def interest_form
  end

end
