ShipmeProj::Application.routes.draw do
 get "user/signup"
 get "user/signin"
 get "user/forgot"
 get "user/create"
 get "user/in"
 get "user/forgot_mail"
 get "user/used"
 get "homepage/index"
 get "user/logout"
 get "messages/view_message"
 get "messages/new_message"
 get "send_message/construct_message"
 get "send_message/send_now"
 get "send_message/view_conversation"
 post '/send_message/send_now', to: 'send_message#send_now'
 get "send_requests/requests" 
 get "/send_requests/requests" => 'send_requests#requests', :as => 'Send_button' 
 post "/send_requests/requests" 
 get "send_requests/count_requests" 
 post "/send_requests/count_requests" 
 get "send_requests/sent" 
 post "/send_requests/sent" 
 get "/send_requests/requsets" 
 get "/send_requests/sent_request" 
 post "/send_requests/sent_request" 
 get "/send_requests/sendrequest"
 get "packagelist/showlist"
 get "compareprices/compare"
 get "admin_homepage/index" 
 get "admin_homepage/view_shipments"
 get "trips/index"
 get "trips/newtrip"
 get "trips/deletetrips"
 get "trips/delete"
 get "handling_requests/index"
 get "handling_requests/show" 
 get "handling_requests/show_package" 
 get "handling_requests/accept"
 get "handling_requests/reject"
 post "handling_requests/accept"
 post "handling_requests/reject"
 get "payment/withdraw" 
 get "payment/add"
 get "payment/notify" 
 get "packages/packageview"
 get "edit_trips/index"
 get "edit_trips/update"
 get "edit_trips/edit"
 get "edit_packages/index"
 get "edit_packages/edit_package" 
 get "edit_packages/update"
 get "reports/Reports" 
 get "reports/index"
 get "reports/createReport"
 get "delete/delete"
 get "revenues/rev"
 post "insert_commision/show" 
 get "users_registerd/count" 
 post "users_registerd/count"
 get "trips/index"
 get "trips/newtrips"
 get "trips/create"
 get "trips/complete"
 get "trips/complete_user"
 get "confirm/confirm"
 get "confirm/list"
 get "notification/index" 
 get "notification/show" 
 get "notification/test"
 post "notification/test"
 post "notification/index" 
 get "create_packages/new"
 post "create_packages/new"
 get "create_packages/index" 
 get "create_packages/show_package" 
 post "create_packages/index"
 resources :users



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root 'user#signin2'
       
  # You can have the root of your site routed with "root"


  # Example of regular route:
   #root_path get 'create_packages/:id' => 'create_packages#index'
  #   get 'create_packages/:format'=> 'create_packages#index'

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
