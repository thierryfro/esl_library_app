Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :dashboard, only: [ :index ]
      get 'students/:id/courses', to: 'students#courses_enrolled'
      resources :students
    end
  end
end
