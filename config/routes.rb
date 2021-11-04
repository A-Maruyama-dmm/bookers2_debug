Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'

  get 'home/about'=>'homes#about'
  get 'search' => 'searchs#search'

  resources :users,only: [:show,:index,:edit,:update] do
    member do   #resourcesは7つのルーティングを行ってくれますが、memberを使うことで、別のルーティングを追加できます。
    get :follows, :followers
  end
  resource :relationships, only: [:create, :destroy]
  #resource :relationships, only: [:create, :destroy]
  #get 'followings' => 'relationships#followings', as: 'followings'
  #get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :books, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]

    resources :book_comments, only: [:create, :destroy]

  end


end