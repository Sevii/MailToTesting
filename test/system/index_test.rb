require "application_system_test_case"
require "selenium-webdriver"

class DocsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers
  # Make the Capybara DSL available in all integration tests

  test "visiting the docs page" do
    user = users(:two)
    sign_in user
    visit '/'

    element = page.find_link(:text => "Contact Us")

    href = element['href']
    assert href.include?(user.email)
    assert href.include?(user.id.to_s)

    click_on "Contact Us"
    take_screenshot
  end


  # Reset sessions and driver between tests
  teardown do
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end
