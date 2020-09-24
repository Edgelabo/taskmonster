Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'todoes#index'
  devise_for :users, controllers: {
      sessions: 'users/registrations',
      sessions: 'users/sessions'
  }

end
