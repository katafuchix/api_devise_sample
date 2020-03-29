Rails.application.routes.draw do
  #mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #mount_devise_token_auth_for 'User', at: 'auth'
  #mount_devise_token_auth_for 'User', at: '/api/v1/auth'

  get '/' => 'admin/index#index'

  #devise_for 'admin/users'
  #devise_for :admin_users
  devise_for 'admin/users', controllers: {
    sessions: 'admin_users/sessions'
  }

  devise_scope 'admin/users' do
		get '/' => 'admin_users/sessions#new'
    get '/admin_users/sign_out' => 'admin_users/sessions#destroy'
  end

  namespace :admin do
    get '/' => 'index#index'
    get 'index' => 'index#index'

    Master.master_routes.keys.each do |type|
      resources type, controller: :masters, type: type.classify
    end

    resources :admin_users, controller: :manage_roles
  end

  mount Versions::V1::Api => '/'
  mount GrapeSwaggerRails::Engine => '/api/swagger'
end
