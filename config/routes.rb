TestGlobocom::Application.routes.draw do
  namespace :api do
    resources :machines, :defaults => { :format => 'json' }
  end
end
