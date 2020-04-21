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

    resources :user_probations, only: [:index, :destroy, :update, :edit, :create]
    resources :users, only: [:index, :show, :destroy, :update, :edit] do
      member do
        patch :update_profile
        put :purchase_payingmember
        put :purchase_point
        put :add_relation_count
        put :send_notification
        put :restore_soft_destroy
        put :toggle_search_status
        delete :profile_image_destroy
      end
    end
    #Master.master_routes.keys.each do |type|
    #  resources type, controller: :masters, type: type.classify
    #end
    resource :user_profiles, only: [] do
      %i(comment good_place date_place dream school_name hobby job_name tweet).each do |approvable_column|
        resources approvable_column, only: [:update, :destroy], controller: :user_profiles do
          collection do
            get :pending
            get :accepted
            get :rejected
            post :accept_selected
            post :reject_selected
          end
        end
      end
    end

    Master.master_routes.keys.each do |type|
      resources type, controller: :masters, type: type.classify
    end

    resources :admin_users, controller: :manage_roles
  end

  mount Versions::V1::Api => '/'
  mount GrapeSwaggerRails::Engine => '/api/swagger'
end
