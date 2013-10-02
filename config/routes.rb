BaseApp::Application.routes.draw do
    
  mount StripeEvent::Engine => '/stripe'

  resources :subscriptions 
    
  resources :plans
    
    
  resources :steps


  resources :incomes


  resources :students


  resources :expenses


  resources :expense_categories


  resources :business_types


  resources :tax_returns
    
  post "versions/:id/revert" => "versions#revert", :as => "revert_version"


    get "password_resets/new"
    get 'update_fields', :controller => 'expenses', :action => :update_fields
    put 'update_card', :controller => 'subscriptions', :action => :update_card
    put 'update_plan', :controller => 'subscriptions', :action => :update_plan
    
    
    resources :users do
        member do
            get :following, :followers
        end
    end
    resources :sessions, only: [:new, :create, :destroy]
    resources :incomes do
        collection do
            delete :destroy_multiple
        end
    end
    resources :clients
    resources :expenses do
        collection do
            delete :destroy_multiple
        end
    end
    resources :microposts, only: [:create, :destroy]
    resources :relationships, only: [:create, :destroy]
    resources :password_resets
    
    root :to => 'static_pages#home'
    match '/help',    to: 'static_pages#help'
    match '/signup',  to: 'users#new'
    match '/pupils',  to: 'clients#new'
    match '/signin',  to: 'sessions#new'
    match '/signout', to: 'sessions#destroy', via: :delete
    match '/subscription/create' => 'subscriptions#create', :as => :create_subscription
    
    # The priority is based upon order of creation:
    # first created -> highest priority.
    
    # Sample of regular route:
    #   match 'products/:id' => 'catalog#view'
    # Keep in mind you can assign values other than :controller and :action
    
    # Sample of named route:
    #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
    # This route can be invoked with purchase_url(:id => product.id)
    
    # Sample resource route (maps HTTP verbs to controller actions automatically):
    #   resources :products
    
    # Sample resource route with options:
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
    
    # Sample resource route with sub-resources:
    #   resources :products do
    #     resources :comments, :sales
    #     resource :seller
    #   end
    
    # Sample resource route with more complex sub-resources
    #   resources :products do
    #     resources :comments
    #     resources :sales do
    #       get 'recent', :on => :collection
    #     end
    #   end
    
    # Sample resource route within a namespace:
    #   namespace :admin do
    #     # Directs /admin/products/* to Admin::ProductsController
    #     # (app/controllers/admin/products_controller.rb)
    #     resources :products
    #   end
    
    # You can have the root of your site routed with "root"
    # just remember to delete public/index.html.
    # See how all your routes lay out with "rake routes"
    
    # This is a legacy wild controller route that's not recommended for RESTful applications.
    # Note: This route will make all actions in every controller accessible via GET requests.
    # match ':controller(/:action(/:id))(.:format)'
end
