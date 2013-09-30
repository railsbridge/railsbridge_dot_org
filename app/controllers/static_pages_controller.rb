class StaticPagesController < ApplicationController

  def home
    @events = sorted_upcoming_events
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
    @events = sorted_upcoming_events
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

  private

  def sorted_upcoming_events
    (Event.all + PastEvent.upcoming_events).sort_by { |e| e.sessions.first.starts_at.to_time }
  end

end
