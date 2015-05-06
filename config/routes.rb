Rails.application.routes.draw do
  resources :topics do
    resources :actions
    resources :view_points do
      member do
        post :move_higher
        post :move_lower
      end
    end
  end
end
