# encoding: utf-8

Encoding.default_external = 'UTF-8'
Encoding.default_internal = 'UTF-8'
require 'bundler'
Bundler.require(:default)

RailsConfig.load_and_set_settings([File.join(File.expand_path('..', __FILE__), 'config/settings.yml'),
                                   File.join(File.expand_path('..', __FILE__), 'config/settings.local.yml')])

require_relative 'support/alert_accept'
require_relative 'support/driver_manager'

require_relative 'pages/login_page'
require_relative 'pages/sk_management_products_page'

