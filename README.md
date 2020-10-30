# README

```
brew install libmagic

bundler init
rails new . --skip-action-mailer --skip-active-storage --skip-action-cable
bundle install --path vendor/bundle


bin/rails g model Task name:string description:string

rails g devise:install
rails g devise_token_auth:install User auth
rails db:migrate


$ bundle install --path vendor/bundle
$ bundle exec rails g config:install

```
