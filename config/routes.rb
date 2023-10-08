Rails.application.routes.draw do
  get 'lists/new'
#データを追加(保存)するためのルーティングは生成されていないため、データを追加するためのルーティングを追記
  post 'lists' => 'lists#create'  #ここに追記
  get 'lists' => 'lists#index'
  #.../lists/1や .../lists/3に該当
  #as:オプションを追加することで'lists#show'の設定を、listとして利用
  get 'lists/:id' => 'lists#show', as: 'list'
  get 'lists/:id/edit' => 'lists#edit' , as: 'edit_list'
  patch 'lists/:id' => 'lists#update' , as: 'update_list'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

#URL「top」にアクセスしたとき、homesコントローラのtopアクションが呼び出されるように設定
get 'top' => 'homes#top'
end
