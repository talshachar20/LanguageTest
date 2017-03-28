require 'selenium-webdriver'

class BasePage

  def initialize(driver)
    ENV['base_url'] = 'https://bluebird.planetromeo.com'
    @driver = driver
    @driver.manage.timeouts.implicit_wait = 6
    @driver.manage.window.maximize #chrome issue on mac with maximize
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end

  def type(locator, input)
    @driver.find_element(locator).send_keys input
  end

  def click_on(locator)
    @driver.find_element(locator).click
  end

  def quit
    @driver.quit
  end

  def find(locator)
    @driver.find_element(locator)
  end

  def text(locator)
    @driver.find_element(locator).text
  end
end
