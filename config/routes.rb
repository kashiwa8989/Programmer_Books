Rails.application.routes.draw do

#   顧客用
# URL /customers/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


  # 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

namespace :admin do
  get 'users/index'
  get 'users/show'
  resources :genres, only: [:index, :create, :edit, :update]

end

scope module: :public do
  resources :books, only: [:index, :create, :new, :show, :edit, :update, :destroy] do
    resources :book_comments, only: [:create, :destroy]
  end
  get "/users/:id/unsubscribe" => "users#unsubscribe", as: "unsubscribe"
  patch "/users/:id/withdraw" => "users#withdraw", as: "withdraw"
  resources :users, only: [:show, :update, :edit, :index] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end


  root "homes#top"
end

end
