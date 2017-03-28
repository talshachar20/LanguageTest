require 'spec_helper'
require './lib/page_objects/login_page.rb'

RSpec.describe Ertaltest do
  context "user visits beta and switch language" do
    let(:login_page) {
      ChatErasysLoginPage.new(Selenium::WebDriver.for :chrome)
    }

    let(:de_login_element) { 'Einloggen' }
    let(:de_login_text) { 'EINLOGGEN' }

    let(:es_login_element) { 'Entrar' }
    let(:es_login_text) { 'ENTRAR' }

    it "login button changes to DE" do
      login_page.visit
      login_page.choose_language('de')
      expect(login_page.login_button_text(de_login_element)).to eq(de_login_text)
    end

    it "login button changes to ES" do
      login_page.visit
      login_page.choose_language('es')
      expect(login_page.login_button_text(es_login_element)).to eq(es_login_text)
    end
  end
end
