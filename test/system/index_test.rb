require "application_system_test_case"
require "selenium-webdriver"

class DocsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  test "visiting the docs page while logged in" do
    user = users(:one)
    sign_in user
    visit '/'

    element = page.find_link(:text => "Contact Us")

    href = element['href']
    assert_includes href, "mailto:info@example.com"
    assert_includes href, user.email
    assert_includes href, user.id.to_s
    click_on "Contact Us"
  end


  test "visiting the docs page" do 
    visit '/' 
    element = page.find_link(:text => "Contact Us") 
    href = element['href'] 
    assert href.include?("mailto:info@example.com") 
  end
end
