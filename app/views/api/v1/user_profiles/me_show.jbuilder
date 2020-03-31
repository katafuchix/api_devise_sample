json.result true
json.message I18n.t('api.success_message.get')
json.profile do

  json.current_sign_in_at @user.current_sign_in_at
end
