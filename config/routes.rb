Rails.application.routes.draw do
  get 'training_groups/join'
  root "courses#index"
  resources :courses, only: [:show] do
    resources :training_groups, only:[] do
      member do
        get "add_new_student"
        patch "join"
      end
    end
  end
  # get "/courses/:id", to: "courses#show", as: "course"
  # get "/courses/:id/new_student", to: "courses#join", as: "join_course"
  # post "/courses/:id/join", to: "courses#join", as: "join_course"
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
