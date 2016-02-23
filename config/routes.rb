Rails.application.routes.draw do

  get 'sessions/new'
  get 'all' => 'users#index'
  get 'users/new'
  get 'signup' => 'users#new'
  get 'contact' => 'static_pages#contact'
  get 'about' => 'static_pages#about'
  root to: "static_pages#home"
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'chat' => 'users#index'
  get "personal_directives" => 'static_pages#personal_directives'
  get 'committee_directives' => 'static_pages#committee_directives'
  get 'crisis_updates' => 'static_pages#crisis_updates'
  
  resources :users
  resources :crises, :controller => "users", :type => "Crisis"
  resources :delegates, :controller => "users", :type => "Delegate"
  
  resources :comments, only: [:index, :create]
  get '/comments/new/(:parent_id)', to: 'comments#new', as: :new_comment
  
  
  resources :directives, only: [:create, :destroy]
  resources :personal_directives, :controller => "directives", :type => "PersonalDirective"
  resources :resolutions, :controller => "directives", :type => "Resolution"
  resources :crisis_updates, :controller => "directives", :type => "CrisisUpdate"
  
  devise_for :users

#  authenticated :user do
#    get 'all' => 'users#index'
#  end

  unauthenticated :user do
    devise_scope :user do
      get "/" => "devise/sessions#new"
    end
  end

  resources :conversations do
    resources :messages
  end

  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
