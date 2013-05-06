class StaticPagesController < ApplicationController

  def home
    add_breadcrumb 'Home', root_path
  end

  def about
    add_breadcrumb 'Home', root_path
    add_breadcrumb 'About', about_path
  end

  def learning
    add_breadcrumb 'Home', root_path
    add_breadcrumb 'Learning', learning_path
  end

  def teaching
    add_breadcrumb 'Home', root_path
    add_breadcrumb 'Teaching', teaching_path
  end

  def organizing
    add_breadcrumb 'Home', root_path
    add_breadcrumb 'Organizing', organizing_path
  end

  def hosting
    add_breadcrumb 'Home', root_path
    add_breadcrumb 'Hosting', hosting_path
  end

  def projects
    add_breadcrumb 'Home', root_path
    add_breadcrumb 'Projects', projects_path
  end

  def learning_resources
    add_breadcrumb 'Home', root_path
    add_breadcrumb 'Learning Resources', learning_resources_path
  end

  def about_chapters
    add_breadcrumb 'Home', root_path
    add_breadcrumb 'About', about_path
    add_breadcrumb 'Chapters', about_chapters_path
  end

  def about_past
    add_breadcrumb 'Home', root_path
    add_breadcrumb 'About', about_path
    add_breadcrumb 'Past Workshops', about_past_path
  end

  def about_team
    add_breadcrumb 'Home', root_path
    add_breadcrumb 'About', about_path
    add_breadcrumb 'Team', about_team_path
  end

  def about_sponsors
    add_breadcrumb 'Home', root_path
    add_breadcrumb 'About', about_path
    add_breadcrumb 'Sponsors', about_sponsors_path
  end

  def helping
    add_breadcrumb 'Home', root_path
    add_breadcrumb 'Helping', helping_path
  end

  def interest_form
    add_breadcrumb 'Home', root_path
    add_breadcrumb 'Interest Form', interest_form_path
  end

end