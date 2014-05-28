# encoding: utf-8

class LoginPage
  include PageObject

  page_url 'http://www.metalloprokat.ru/login'

  text_field(:email, class: 'form-email')
  text_field(:password, class: 'password')
  button(:submit, class: 'send-button')

  def login(mail, pass)
    email_element.when_visible.value = mail
    password_element.when_visible.value = pass
    submit_element.when_visible.click
  end
end