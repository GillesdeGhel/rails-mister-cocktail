Rails.application.routes.draw do

  resources :cocktails do
    resources :doses
  end
  get 'search', to: 'cocktails#search', as: :search
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
