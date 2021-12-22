Rails.application.routes.draw do
  resources :questions, only: [:new, :show, :create] do
    resources :answers, only: [:new, :show, :create], shallow: true
  end
end
