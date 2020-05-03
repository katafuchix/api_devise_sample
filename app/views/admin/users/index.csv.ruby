require 'csv'

CSV.generate do |csv|
  csv << [
      User.human_attribute_name(:email),
      User.human_attribute_name(:id),
      UserProfile.human_attribute_name(:name),
      '年齢',
      User.human_attribute_name(:mobile_phone),
      UserProfile.human_attribute_name(:sex),
      UserProfile.human_attribute_name(:prof_address_id),
      UserProfile.human_attribute_name(:prof_job_id),
      UserProfile.human_attribute_name(:job_name),
      UserProfile.human_attribute_name(:prof_annual_income_id),
      UserProfile.human_attribute_name(:birthday),
      UserProfile.human_attribute_name(:prof_birth_place_id),
      UserProfile.human_attribute_name(:height),
      UserProfile.human_attribute_name(:blood),
      UserProfile.human_attribute_name(:prof_drinking_habit_id),
      UserProfile.human_attribute_name(:prof_expect_support_money_id),
      UserProfile.human_attribute_name(:prof_figure_id),
      UserProfile.human_attribute_name(:prof_first_date_cost_id),
      UserProfile.human_attribute_name(:prof_have_child_id),
      UserProfile.human_attribute_name(:prof_holiday_id),
      UserProfile.human_attribute_name(:prof_marriage_id),
      UserProfile.human_attribute_name(:prof_personality_id),
      UserProfile.human_attribute_name(:prof_request_until_meet_id),
      UserProfile.human_attribute_name(:prof_smoking_habit_id),
      UserProfile.human_attribute_name(:prof_educational_background_id),
      UserProfile.human_attribute_name(:hobby),
      UserProfile.human_attribute_name(:comment),
      UserProfile.human_attribute_name(:tweet),
      UserProfile.human_attribute_name(:dream),
      UserProfile.human_attribute_name(:school_name)
  ]
  @users.each do |user|
    csv << [
        user.email,
        user.id,
        user.user_profile.name,
        user.user_profile.age,
        user.mobile_phone,
        user.user_profile.sex_i18n,
        user.user_profile.prof_address.try(:name),
        user.user_profile.prof_job.try(:name),
        user.user_profile.job_name,
        user.user_profile.prof_annual_income.try(:name),
        user.user_profile.birthday.try(:to_date),
        user.user_profile.prof_birth_place.try(:name),
        user.user_profile.height,
        user.user_profile.blood_i18n,
        user.user_profile.prof_drinking_habit.try(:name),
        user.user_profile.prof_expect_support_money.try(:name),
        user.user_profile.prof_figure.try(:name),
        user.user_profile.prof_first_date_cost.try(:name),
        user.user_profile.prof_have_child.try(:name),
        user.user_profile.prof_holiday.try(:name),
        user.user_profile.prof_marriage.try(:name),
        user.user_profile.prof_personality.try(:name),
        user.user_profile.prof_request_until_meet.try(:name),
        user.user_profile.prof_smoking_habit.try(:name),
        user.user_profile.prof_educational_background.try(:name),
        user.user_profile.hobby,
        user.user_profile.comment,
        user.user_profile.tweet,
        user.user_profile.dream,
        user.user_profile.school_name
    ]
  end
end