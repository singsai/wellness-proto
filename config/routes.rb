WellnessProto::Application.routes.draw do
  get "teams/index"

  get "memberships/index"

  get "dashboard/index"

  root to: 'pages#index' 

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :pages

  resources :teams do
    member do
      get :send_registration_email
      get :send_week1_reminder
      get :send_week2_reminder
      get :send_week3_reminder
      get :send_week4_reminder    
    end
  end

  resources :memberships
  resources :sessions
  resources :locations
  resources :people
  resources :competitions
  
  namespace :admin do
    get '', to: 'dashboard#index', as: "/"

    resources :locations
    
    resources :teams do
      member do
        get :send_week1_reminder
        get :send_week2_reminder
        get :send_week3_reminder
        get :send_week4_reminder    
        #get 'admin/teams/:id/send_reminder' => 'admin/teams#send_reminder'
      end
    end
    
    resources :competitions
    
    resources :memberships do    
      resources :users      
    end  
  end
  
  
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
