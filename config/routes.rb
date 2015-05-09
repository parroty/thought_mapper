Rails.application.routes.draw do
  root :to => redirect("/topics")

  resources :topics do
    resources :candidates
    resources :view_points do
      member do
        post :move_higher
        post :move_lower
      end
    end
    resources :factors
  end
end
