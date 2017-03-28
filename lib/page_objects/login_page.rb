require_relative 'base_page'

class ChatErasysLoginPage < BasePage
  attr_accessor :driver, :selectors
  @driver = nil

  def initialize(driver)
    super
    initialize_selectors
  end

  def visit
    @driver.navigate.to ENV['base_url']
  end

  def choose_language(language)
     click_on(selectors[:LANGUAGE_SELECTOR])
     click_on(css: "a[data-language-iso639='" + language +"'")
  end

  def login_button_text(login_text)
    find(css: "button[title='"+ login_text +"'")
    text(selectors[:LOGIN_BUTTON])
  end

  private

  def initialize_selectors
    @selectors = {
        LANGUAGE_SELECTOR:  { class: 'language-selector' },
        LOGIN_BUTTON: {class: "login__button"},
    }
  end
end
