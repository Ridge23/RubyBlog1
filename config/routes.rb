Rails.application.routes.draw do
  resources :articles

  devise_for :users
  get 'persons/profile', as: 'user_root'

  get 'admin/users' => 'index#admin_users'

  get 'admin/users/set_moderator/:id', to: 'persons#admin_set_moderator', as: 'admin_set_moderator'
  get 'admin/users/remove/:id', to: 'persons#admin_set_moderator', as: 'admin_user_remove'

  get 'admin/articles', to: 'index#admin_articles_moderation', as: 'admin_articles'

  get 'admin/articles/moderate/:id', to: 'articles#moderate', as: 'admin_moderate_article'

  get 'articles/find/:tag', to: 'articles#find', as: 'article_find_by_tag'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'index#index'

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
