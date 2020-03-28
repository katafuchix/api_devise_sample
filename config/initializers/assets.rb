# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )


Rails.application.config.assets.precompile += %w(
 webpage.js
 webpage.css
 user.css
 admin.css
 common.css
 webpage-all.js
 webpage-all.css
 webpage-all/user_age_certification.js
 webpage-all/incomming_relation.js
 admin.js
 webpage-all/card.css
 webpage-all/card.js
 webpage-all/user_violation_report.js
 webpage-all/user_invitation.js
 webpage-all/me/profile.js
 amaretti/lib/select2/css/select2.min.css
 amaretti/css/style.css
 amaretti/lib/jquery.nanoscroller/css/style.css
 amaretti/lib/stroke-7/style.css
)
