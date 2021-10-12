Rails.application.routes.draw do
  root to: 'restaurants#index'

  # resources :a do
  #   resources :b do
  #     resources :c do
  #       # /a/:a_id/b/:b_id/c/:c_id/d
  #       resources :d, only: [:index]
  #     end
  #   end
  # end

  # independent
  resources :restaurants do
    collection do
      get :top
      # get :worst
    end

    member do
      get :chef
    end

    # If inside the block, this means that it is a NESTED resource
    # Which means:
    # It starts with parent_resources/:parent_resources_id/the-normal-route
    # /restaurants/:restaurant_id/reviews
    resources :reviews, only: [:index, :create]
  end


  # /reviews
  # resources :reviews, only: [:index]

  # independent
  resources :reviews, only: [:edit, :update, :destroy]
end
