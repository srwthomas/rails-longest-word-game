Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'games#new', as: :new
  get 'score', to: 'games#score', as: :score
end
