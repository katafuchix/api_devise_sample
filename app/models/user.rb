# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable #, :trackable,
  include DeviseTokenAuth::Concerns::User
  include Logic::User

  has_one :user_profile, class_name: 'UserProfile', dependent: :destroy
  soft_deletable column: :deleted_at

  attr_accessor :edit_type

end
