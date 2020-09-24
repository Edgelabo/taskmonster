Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'todoes#index'
  devise_for :users, controllers: {
      sessions: 'users/registrations',
      sessions: 'users/sessions'
  }
  resources :todoes, except: [:show]
  #タスク作成機能
  post 'todoes/show' => 'todoes#task_create'
  #タスク完了
  patch 'todoes/show/:id' => 'todoes#task_check', as: :check
  get "users/:id" => "todoes#show", as: :mypage

end
