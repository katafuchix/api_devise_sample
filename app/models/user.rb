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

  scope :males, -> { joins(:user_profile).where(user_profiles: { sex: ::UserProfile.sexes[:male] }) }
  scope :females, -> { joins(:user_profile).where(user_profiles: { sex: ::UserProfile.sexes[:female] }) }
  delegate :sex, to: :user_profile, allow_nil: true

  has_many :articles, class_name: 'Article', dependent: :destroy

  include UsersHasMany
  create_self_association :user_matchs
  create_self_association :user_relations
  create_self_association :user_favorites
  create_self_association :user_blocks
  #create_self_association :user_violations
  create_self_association :user_displays
  create_self_association :user_visitors
  create_self_association :user_pickups
  create_self_association :user_memos

  # user_match_idを持っているいいねレコード
  has_many :incomming_matched_relations, -> { where.not(user_match_id: nil) }, class_name: 'UserRelation', foreign_key: :target_user_id, dependent: :destroy
  has_many :incomming_matched_relation_users, through: :incomming_matched_relations, source: :user

  # スキップしたいいねレコード
  has_many :outcomming_relation_skipped, -> { where(skipped: true) }, class_name: 'UserRelation', foreign_key: :target_user_id
  has_many :outcomming_relation_users_skipped, through: :outcomming_relation_skipped, source: :user

  # いいねユーザー
  has_many :outcomming_active_relations, -> { where(active: true) }, class_name: 'UserRelation', dependent: :destroy
  has_many :incomming_active_relations, -> { where(active: true) }, class_name: 'UserRelation', foreign_key: :target_user_id, dependent: :destroy
  has_many :outcomming_active_relation_users, through: :outcomming_active_relations, source: :target_user
  has_many :incomming_active_relation_users, through: :incomming_active_relations, source: :user
  has_many :outcomming_pending_relations, -> { where(active: false) }, class_name: 'UserRelation', dependent: :destroy
  has_many :incomming_pending_relations, -> { where(active: false) }, class_name: 'UserRelation', foreign_key: :target_user_id, dependent: :destroy
  has_many :outcomming_pending_relation_users, through: :outcomming_pending_relations, source: :target_user
  has_many :incomming_pending_relation_users, through: :incomming_pending_relations, source: :user

  has_many :user_payments, -> { enabled.order('updated_at DESC') }, dependent: :destroy

end
