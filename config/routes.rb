Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'todoes#index'
  devise_for :users, controllers: {
      sessions: 'users/registrations',
      sessions: 'users/sessions'
  }
  devise_scope :user do
    get "users/sign_out", :to => "users/sessions#destroy"
  end
  resources :todoes, except: [:show]
  #メインページ
  get "users/:id" => "todoes#show", as: :mypage
  #タスク作成機能
  post 'todoes/show' => 'todoes#task_create'
  #タスク完了
  patch 'todoes/show/:id' => 'todoes#task_check', as: :check
  #タスク削除
  delete 'todoes/show/:id' => 'todoes#destroy', as: :task
end
