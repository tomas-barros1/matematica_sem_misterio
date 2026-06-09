Rails.application.routes.draw do
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"

  resource :dashboard, only: :show, controller: :dashboard
  resource :profile, only: :show

  resources :subjects, only: %i[index show]
  resources :lessons, only: %i[index show] do
    resource :completion, only: :create, controller: :lesson_completions
  end
  resources :ranking, only: :index
  resources :achievements, only: :index

  namespace :admin do
    resources :users, only: %i[index edit update]
    resources :subjects
    resources :lessons
    resources :questions
  end
end
