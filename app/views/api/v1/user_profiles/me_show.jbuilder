json.result true
json.message I18n.t('api.success_message.get')
json.profile do

  json.user_id @user.id
  json.user_profile_id @user.user_profile.id
end
