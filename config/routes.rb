RailsbridgeSite2013::Application.routes.draw do
  # devise_for :admin_users, ActiveAdmin::Devise.config
  # ActiveAdmin.routes(self)

  root to: 'static_pages#home'

  match '/about',              to: 'static_pages#about',              as: 'about'
  match '/about/team',         to: 'static_pages#team',               as: 'team'
  match '/about/sponsors',     to: 'static_pages#sponsors',           as: 'sponsors'
  match '/about/chapters',     to: 'static_pages#chapters',           as: 'chapters'
  match '/about/past_events',  to: 'static_pages#past_events',        as: 'past_events'
  match '/about/projects',     to: 'static_pages#projects',           as: 'projects'

  match '/help',               to: 'static_pages#help',               as: 'help'
  match '/help/teach',         to: 'static_pages#teach',              as: 'teach'
  match '/help/organize',      to: 'static_pages#organize',           as: 'organize'
  match '/help/host',          to: 'static_pages#host',               as: 'host'
  match '/help/donor_faq',     to: 'static_pages#donor_faq',          as: 'donor_faq'
  match '/help/interest_form', to: 'static_pages#interest_form',      as: 'interest_form'

  match '/learn',              to: 'static_pages#learn',              as: 'learn'
  match '/learn/resources',    to: 'static_pages#learning_resources', as: 'learning_resources'
  match '/learn/faq',          to: 'static_pages#learning_faq',       as: 'learning_faq'
  match '/learn/events',       to: 'static_pages#events',             as: 'events'

end
