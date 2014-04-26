MakeADate::Application.routes.draw do

  resources :events, only:[:new, :create]

  get 'event/:url_param'      => 'events#show',   as: :show_event
  get 'event/:url_param/edit' => 'events#edit',   as: :edit_event
  patch 'events/:url_param'   => 'events#update', as: :event

#  resources :attendances, only:[:new, :create, :edit, :update]

  post  'attendances/:url_param'      => 'attendances#create', as: :attendances
  get   'attendances/new/:url_param'  => 'attendances#new',    as: :new_attendance
  get   'attendances/:url_param/:id/edit' => 'attendances#edit',   as: :edit_attendance
  patch 'attendances/:url_param/:id'      => 'attendances#update', as: :attendance

#    attendances POST  /attendances(.:format)           attendances#create
# new_attendance GET   /attendances/new(.:format)       attendances#new
#edit_attendance GET   /attendances/:id/edit(.:format)  attendances#edit
#     attendance PATCH /attendances/:id(.:format)       attendances#update

  root "events#new"

#  get "users/new/:url_param" => "users#new"
#  post "users/create/"       => "users#create"

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
