Rails.application.routes.draw do
  resources :topics do
    resources :actions
    resources :view_points
  end
end
