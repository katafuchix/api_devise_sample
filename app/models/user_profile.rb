class UserProfile < ApplicationRecord
  #enum sex: %w(male female)
  #enum blood: %w(a b o ab)
  belongs_to :user
end
