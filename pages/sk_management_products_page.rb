# encoding: utf-8

class SkManagementProductsPage
  include PageObject

  page_url 'http://my.metalloprokat.ru/management/products'

  button(:actualize, class: 'revert')
  paragraph(:last_update, class: 'last-update')
end

