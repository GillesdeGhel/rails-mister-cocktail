Rails.application.routes.draw do
  get 'cocktails/search', to: 'cocktails#search'
  resources :cocktails do
    resources :doses
    resources :reviews
  end
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
