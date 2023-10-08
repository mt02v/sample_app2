Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

#URL「top」にアクセスしたとき、homesコントローラのtopアクションが呼び出されるように設定
get 'top' => 'homes#top'
resources :lists
end
