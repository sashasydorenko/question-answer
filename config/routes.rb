RorAngularQuestions::Application.routes.draw do
  namespace :api do
    resources :categories do
      resources :questions do
        member do
          put :status
        end

        resources :comments
      end
    end
  end

  root 'main#index'
  match '*path' => 'main#index', via: [:get, :post]
end
