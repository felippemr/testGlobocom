TestGlobocom::Application.routes.draw do
  namespace :api, :defaults => { :format => 'json' } do
  	namespace :v1 do
      resources :machines
      resources :applications
    end
  end
end
