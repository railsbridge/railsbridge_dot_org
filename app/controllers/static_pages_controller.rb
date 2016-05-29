class StaticPagesController < ApplicationController
  before_action :assign_upcoming_events, only: [:home, :events]

  def home
  end

  def about
  end

  def brand
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
  end

  def past_events
    @past_events = Event.sorted_events(:past, organization_id: Event::RAILSBRIDGE_ORGANIZATION_ID)
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

  def assign_upcoming_events
    all_events = Event.sorted_events(:upcoming)
    @railsbridge_events, @other_events = all_events.partition do |e|
      e.try(:organization) == 'RailsBridge'
    end
  end
end
