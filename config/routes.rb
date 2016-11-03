Rails.application.routes.draw do
  get 'home/index'

  post 'home/contact'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
