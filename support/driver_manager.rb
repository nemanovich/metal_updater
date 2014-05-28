# encoding: utf-8
require 'singleton'
require 'rbconfig'
require 'selenium-webdriver'

class DriverManager
  include Singleton
  attr_accessor :driver

  def kill_phantomjs(driver)
    driver.instance_variable_get(:@bridge).instance_variable_get(:@service).stop
  end

  def init_browser
    browser = Selenium::WebDriver.for(:phantomjs)
    browser.manage.timeouts.implicit_wait = 0
    browser.manage.timeouts.script_timeout = 10
    browser.manage.delete_all_cookies

    browser
  end

  def driver
    @driver ||= init_browser
  end

  def quit
    if @driver.present?
      @driver.close
      kill_phantomjs(@driver)
    end
  rescue Errno::ECONNREFUSED
  ensure
    @driver = nil
  end

  class << self
    def driver
      instance.driver
    end

    def quit
      instance.quit
    end

    def init_browser
      instance.init_browser
    end
  end
end
