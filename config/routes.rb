Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root 'pipeline_list#index'
  resources :pipeline_list, only: [:index] do
    patch 'update_row_order/:task_id', action: :update_row_order, as: 'update_row_order', on: :member
  end
end
