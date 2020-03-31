module Versions
  module V1
    module TestUserProfile
      extend ActiveSupport::Concern
      included do
        namespace :test do
          namespace :user do
            namespace :profile do
              #auth :grape_devise_token_auth, resource_class: :user

              #helpers GrapeDeviseTokenAuth::AuthHelpers

              desc '自分のユーザープロフィールを取得する'
              params do
                requires :auth_token, type: String, desc: '認証トークン'
                optional :edit_type, type: String, desc: '入力タイプ("create"or"update")'
              end
              get '', jbuilder: 'v1/user_profiles/me_show' do
                authenticated!
                @user = User.includes(user_profile: UserProfile.eager_loading_list).find(current_user.id).try(:grant_gender)
                @user.edit_type = params[:edit_type]
              end

            end
          end
        end
      end
    end
  end
end
