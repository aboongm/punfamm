Rails.application.routes.draw do
  root "pages#home"
  
  get 'pages/world'
  get 'pages/politics'
  get 'pages/business'
  get 'pages/health'
  get 'pages/entertainment'
  get 'pages/style'
  get 'pages/travel'
  get 'pages/sports'
  get 'pages/videos'
  get 'pages/tech'
  get 'pages/features'
  get 'pages/market'
  get 'pages/opinion'
  get 'pages/underconstruction'
  
  resources :news_item_dailies
  resources :news_items
  resources :dailies
  resources :categories

  resources :news_items do
    get 'subcategories', on: :collection
  end

  devise_for :users,
  path: '',
  path_names: { sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration' }, 
  controllers: { sessions: 'users/sessions', 
                 registrations: 'users/registrations' }
  
end
