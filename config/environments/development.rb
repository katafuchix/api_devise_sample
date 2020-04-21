Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations.
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  config.after_initialize do
    Bullet.enable = true
    Bullet.alert = true
    Bullet.bullet_logger = true
    Bullet.add_footer   = true
    Bullet.console = true
    Bullet.rails_logger = true
    Bullet.raise = true
    UserProfile::EAGER_LOADING_LIST.each do |eager_loading|
      Bullet.add_whitelist type: :unused_eager_loading, class_name: 'UserProfile', association: eager_loading
    end
    Bullet.add_whitelist type: :unused_eager_loading, class_name: 'ProfileImage', association: :user_profile
    Bullet.add_whitelist type: :unused_eager_loading, class_name: 'UserProfile', association: :user
    Bullet.add_whitelist type: :n_plus_one_query, class_name: 'User', association: :user_notify
    Bullet.add_whitelist type: :n_plus_one_query, class_name: 'UserProfile', association: :prof_birth_place
    Bullet.add_whitelist type: :unused_eager_loading, class_name: 'UserMatch', association: :user
    Bullet.add_whitelist type: :n_plus_one_query, class_name: 'ProfileImage', association: :user_profile
    #[:user_profile, :user_payments].each do |association|
    #  Bullet.add_whitelist type: :unused_eager_loading, class_name: 'User', association: association
    #end
    #Bullet.add_whitelist type: :unused_eager_loading, class_name: 'ProfileImage', association: :user_profile
    Bullet.add_whitelist :type => :n_plus_one_query, :class_name => "UserProfile", :association => :user
    #Bullet.add_whitelist type: :unused_eager_loading, class_name: 'AdminIssuedInviteCode', association: :used_user
    #Bullet.add_whitelist type: :unused_eager_loading, class_name: 'UserAgeCertification', association: :document_image_admin_user
    #Bullet.add_whitelist type: :unused_eager_loading, class_name: 'UserIncomeCertification', association: :document_image_admin_user
    #Bullet.add_whitelist type: :unused_eager_loading, class_name: 'PurchasePayingmemberCampaign', association: :purchase_payingmember
    #Bullet.add_whitelist type: :n_plus_one_query, class_name: 'UserProfile', association: :profile_images
    #Bullet.add_whitelist type: :unused_eager_loading, class_name: 'UserRelation', association: :message_admin_user
    #Bullet.add_whitelist type: :n_plus_one_query, class_name: 'UserPointPayment', association: :user
    #Bullet.add_whitelist type: :n_plus_one_query, class_name: 'Inquiry', association: :inquiry_category
    #Bullet.add_whitelist type: :n_plus_one_query, class_name: 'Inquiry', association: :inquiry_leaving_reasons
    #Bullet.add_whitelist type: :unused_eager_loading, class_name: 'User', association: :user_app_version_info
  end
end
