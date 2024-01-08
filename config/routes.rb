Rails.application.routes.draw do
  
# 管理者用
# URL /admin/sign_in ...
  devise_for :dieticians, controllers: {
  sessions: "admin/sessions"
}
  
# 顧客用
# URL /customers/sign_in ...
  devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  
    root to: 'homes#top'
end
