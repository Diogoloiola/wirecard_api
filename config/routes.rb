Rails.application.routes.draw do
  namespace :admin, defaults: { format: :json } do
    namespace :v1 do
      resources :cards do
        get 'validate', on: :member
      end
      resources :users
      resources :payments
      resources :issuing_banks
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
