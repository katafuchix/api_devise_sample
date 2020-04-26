class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[6.0]
  def change

    create_table(:users) do |t|
      ## Required
      t.string :provider, :null => false, :default => "email"
      t.string :uid, :null => false, :default => ""

      ## Database authenticatable
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.boolean  :allow_password_change, :default => false

      ## Rememberable
      t.datetime :remember_created_at

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## User Info
      t.string :name
      t.string :nickname
      t.string :image
      t.string :email

      ## Tokens
      t.text :tokens

      t.timestamps

      ### add
      t.string :authentication_token
      t.integer  :status,     :default => 0,     :null => false

      t.integer  "incomming_visitors_count",                         default: 0,     null: false
      t.integer  "outcomming_visitors_count",                        default: 0,     null: false
      t.integer  "remain_relation_count",                            default: 0,     null: false
      t.integer  "outcomming_pickups_count",                         default: 0,     null: false
      t.integer  "incomming_pickups_count",                          default: 0,     null: false

      t.integer  "friends_count",                          default: 0,     null: false
      t.integer  "unread_friends_count",                   default: 0,     null: false
      t.integer  "unread_messages_count",                  default: 0,     null: false
      t.string   "device_token"
      t.integer  "profile_images_count",                   default: 0
      t.integer  "user_favorites_count",                   default: 0
      t.integer  "incomming_blocks_count",                 default: 0,     null: false
      t.integer  "outcomming_blocks_count",                default: 0,     null: false
      t.integer  "outcomming_favorites_count",             default: 0,     null: false
      t.integer  "incomming_favorites_count",              default: 0,     null: false
      t.integer  "incomming_relations_count",              default: 0,     null: false
      t.integer  "outcomming_relations_count",             default: 0,     null: false
      t.integer  "incomming_matches_count",                default: 0,     null: false
      t.integer  "outcomming_matches_count",               default: 0,     null: false
      t.integer  "incomming_displays_count",               default: 0,     null: false
      t.integer  "outcomming_displays_count",              default: 0,     null: false
      t.integer  "incomming_violations_count",             default: 0,     null: false
      t.integer  "outcomming_violations_count",            default: 0,     null: false

      t.integer  "sign_in_count",                          default: 0,     null: false
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.string   "current_sign_in_ip"
      t.string   "last_sign_in_ip"
      t.string   "mobile_phone",                limit: 64
      t.string   "unconfirmed_mobile_phone",    limit: 64
      t.string   "sms_verification_code"
      t.boolean  "sms_confirmed",                          default: false, null: false
      t.datetime :deleted_at
    end

    add_index :users, :email,                unique: true
    add_index :users, [:uid, :provider],     unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,       unique: true

    add_index :users, :authentication_token, unique: true, using: :btree
    add_index :users, :statsu, using: :btree
    add_index :users, :deleted_at, using: :btree
  end
end
