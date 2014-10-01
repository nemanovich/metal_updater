# encoding: utf-8
require_relative 'environment'

desc 'Update products'
task :update_products do
  LoginPage.new(DriverManager.driver, true).login(Settings.user.email, Settings.user.password)
  update_page = SkManagementProductsPage.new(DriverManager.driver, true)
  update_page.alert_accept { update_page.actualize_element.when_visible(15).click }
end



