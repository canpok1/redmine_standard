# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  resources :projects do
    resources :foos do
        post 'preview', :on => :collection
        put  'preview', :on => :member
    end
  end
end
