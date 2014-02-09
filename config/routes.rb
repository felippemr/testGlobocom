TestGlobocom::Application.routes.draw do
  namespace :api do
    resources :machines, :defaults => { :format => 'json' }
    resources :applications, :defaults => { :format => 'json' }
  end
end
