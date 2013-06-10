RailsbridgeSite2013::Application.routes.draw do
  # devise_for :admin_users, ActiveAdmin::Devise.config
  # ActiveAdmin.routes(self)

  root to: 'static_pages#home'

  match '/about',                       to: 'static_pages#about',              as: 'about'
  match '/about/team',                  to: 'static_pages#team',               as: 'team'
  match '/about/sponsors',              to: 'static_pages#sponsors',           as: 'sponsors'
  match '/about/chapters',              to: 'static_pages#chapters',           as: 'chapters'
  match '/about/past_events',           to: 'static_pages#past_events',        as: 'past_events'
  match '/about/projects',              to: 'static_pages#projects',           as: 'projects'

  match '/helping',                     to: 'static_pages#helping',            as: 'helping'
  match '/helping/teaching',            to: 'static_pages#teaching',           as: 'teaching'
  match '/helping/organizing',          to: 'static_pages#organizing',         as: 'organizing'
  match '/helping/hosting',             to: 'static_pages#hosting',            as: 'hosting'
  match '/helping/donor_faq',           to: 'static_pages#donor_faq',          as: 'donor_faq'
  match '/helping/interest_form',       to: 'static_pages#interest_form',      as: 'interest_form'

  match '/learning',                    to: 'static_pages#learning',           as: 'learning'
  match '/learning/learning_resources', to: 'static_pages#learning_resources', as: 'learning_resources'
  match '/learning/learning_faq',       to: 'static_pages#learning_faq',       as: 'learning_faq'
  match '/learning/events',             to: 'static_pages#events',             as: 'events'

end
