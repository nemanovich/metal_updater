# encoding: utf-8

module PageObject
  # Internal: Подтверждение действия в алерте. Работает в том числе для phantomjs
  #
  # &block - Обязательный блок c действием, вызывающим alert.
  #
  # Examples
  #
  #   alert_accept { page.smth_do }
  #
  # Returns nothing
  def alert_accept(&block)
    if self.browser.capabilities[:browser_name] == 'phantomjs'
      execute_script("window.confirm = function(){return true;}")
      block.call
    else
      block.call
      self.browser.switch_to.alert.accept
    end
  end
end
