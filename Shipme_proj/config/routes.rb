ShipmeProj::Application.routes.draw do
  #new routes
  get "requests/show_package" 
  get "requests/accept"
  get "requests/reject"
  get "requests/show" 
  get "requests/cancel"
  post "requests/cancel" 
  post "requests/accept" 
  post "requests/reject"
  get "packages/list_takingpackage"
  get "requests/createhelper"
  get "send_sms/send_sms"
  get "send_sms/message"
  get "send_sms/test"
  get "admin/chart"
  get "admin/index"
  get "admin/new"
  get "admin/create"
  get "admin/edit"
  get "admin/update"
  get "admin/list"
  get "admin/show"
  get "admin/delete"
  get "admin/destory"
  get "messages/index"
  get "messages/new"
  get "messages/create"
  get "messages/edit"
  get "messages/update"
  get "messages/list"
  get "messages/show"
  get "messages/delete"
  get "messages/destory"
  get "authentication/index"
  get "authentication/new"
  get "authentication/create"
  get "authentication/edit"
  get "authentication/update"
  get "authentication/list"
  get "authentication/show"
  get "authentication/delete"
  get "authentication/destory"
  get "reports/index"
  get "reports/new"
  get "reports/create"
  get "reports/edit"
  get "reports/update"
  get "reports/list"
  get "reports/show"
  get "reports/delete"
  get "reports/destory"
  get "payments/index"
  get "payments/new"
  get "payments/create"
  get "payments/edit"
  get "payments/update"
  get "payments/list"
  get "payments/show"
  get "payments/delete"
  get "payments/destory"
  get "notifications/index"
  get "notifications/new"
  get "notifications/create"
  get "notifications/edit"
  get "notifications/update"
  get "notifications/list"
  get "notifications/show"
  get "notifications/delete"
  get "notifications/destory"
  get "configurations/index"
  get "configurations/new"
  get "configurations/create"
  get "configurations/edit"
  get "configurations/update"
  get "configurations/list"
  get "configurations/show"
  get "configurations/delete"
  get "configurations/destory"
  get "trips/index"
  get "trips/new"
  get "trips/create"
  get "trips/edit"
  get "trips/update"
  get "trips/list"
  get "trips/show"
  get "trips/delete"
  get "trips/destory"
  post"trips/destory"
  get "packages/index"
  get "packages/new"
  get "packages/create"
  get "packages/edit"
  get "packages/update"
  get "packages/list"
  get "packages/show"
  get "packages/delete"
  get "packages/destory"
  post"packages/destory"
  get "users/index"
  get "users/new"
  get "users/create"
  get "users/edit"
  get "users/update"
  get "users/list"
  get "users/show"
  get "users/delete"
  get "users/destory"
  get "requests/index"
  get "requests/new"
  get "requests/create"
  get "requests/edit"
  get "requests/update"
  get "requests/list"
  get "requests/show"
  get "requests/delete"
  get "requests/destory"
  get "homepage/list"
  get "user_log/sign_up"
  get "user_log/sign_in2"
  get "user_log/create"
  get "user_log/sign_in"
  get "user_log/in"
  get "user_log/forgot_mail"
  get "user_log/forget"
  get "user_log/log_out"
  get "user_log/used" 
  get "packages/confirm_delivery"
  get "homepage/instructions"

  #old routes
 get "user/signup"
 get "user/signin"
 get "user/forgot"
 get "user/create"
 get "user/in"
 get "user/forgot_mail"
 get "user/used"
 get "homepage/index"
 get "user/logout"
 get "compareprices/compare"
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



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root 'homepage#index'       
  # You can have the root of your site routed with "root"


  # Example of regular route:
   #root_path get 'create_packages/:id' => 'create_packages#index'
  # get 'create_packages/:format'=> 'create_packages#index'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  # get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  # resources :products

  # Example resource route with options:
  # resources :products do
  # member do
  # get 'short'
  # post 'toggle'
  # end
  #
  # collection do
  # get 'sold'
  # end
  # end

  # Example resource route with sub-resources:
  # resources :products do
  # resources :comments, :sales
  # resource :seller
  # end

  # Example resource route with more complex sub-resources:
  # resources :products do
  # resources :comments
  # resources :sales do
  # get 'recent', on: :collection
  # end
  # end

  # Example resource route with concerns:
  # concern :toggleable do
  # post 'toggle'
  # end
  # resources :posts, concerns: :toggleable
  # resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  # namespace :admin do
  # # Directs /admin/products/* to Admin::ProductsController
  # # (app/controllers/admin/products_controller.rb)
  # resources :products
  # end
end





