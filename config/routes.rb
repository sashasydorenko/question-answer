RorAngularQuestions::Application.routes.draw do
  namespace :api do
    resources :categories do
      resources :questions do
        resources :comments

        member do
          put :status
        end
      end
    end
  end

  root 'main#index'
  match '*path' => 'main#index', via: [:get, :post]
end
