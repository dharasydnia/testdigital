Testdigital::Application.routes.draw do
  resources :resources

  get "contents/index"

  get "chapters/index"

  get "welcome/index"

  resources :chapters
  resources :contents

  root :to => 'welcome#index'

  devise_for :users
end
