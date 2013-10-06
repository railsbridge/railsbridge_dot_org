class StaticPagesController < ApplicationController

  def home
    @events = Event.sorted_events(:upcoming)
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
    @events = Event.sorted_events(:upcoming)
  end

  def past_events
    @past_events = Event.sorted_events(:past)
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
