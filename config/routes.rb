Rails.application.routes.draw do
  resources :cates
  resources :items
  devise_for :managers
  devise_for :users
  # 分三層
  # 第一層：public
  # resources :statics, :only => [:index]
  # root "statics#index"
  root "items#index"

  # 第二層：購物車
  resources :items, :only => [:index, :show]

  # 上面的網址：
  # /statics/action/
  #
  # namespace裡面的網址：
  # dashboard/items/action

  # 第三層：dashboard
  namespace :dashboard do
    resources :orders

    namespace :admin do  #現在是教學示例，建議:admin寫成亂碼，像是:sakwejh，這樣才不會被猜到
      # 一個系統在打時，建議從後面打到前面，例如先從管理介面開始打
      resources :items  # 要賣的東西
      resources :cates  # 要賣的東西的分類
      resources :orders # 訂單
      resources :users
      resources :managers
    end
  end

end