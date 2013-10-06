class StaticPagesController < ApplicationController

  def home
    @events = Event.upcoming_events
  end

  def about
  end

  def learn
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
    @events = Event.upcoming_events
  end

  def past_events
    @past_events = Event.past_events
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
