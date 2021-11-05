require "test_helper"

require 'capybara'
require 'selenium-webdriver'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
 




Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app,
    :browser => :chrome,
    :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
       'chromeOptions': {
                      'prefs': {
                          'registered_protocol_handlers' => [{
                            'default' => true,
                            'protocol' => "mailto",
                            'title' => 'Gmail',
                            'url' => 'https://mail.google.com/mail/?extsrc=mailto&url=%s'
                          }]
                      }
                  }
    )
  )
end

Capybara.default_driver = :chrome

end
 # capabilities = {
 #    'chromeOptions': {
 #                      'prefs': {
 #                          'registered_protocol_handlers' => [{
 #                            'default' => true,
 #                            'protocol' => "mailto",
 #                            'title' => 'Gmail',
 #                            'url' => 'https://mail.google.com/mail/?extsrc=mailto&url=%s'
 #                          }]
 #                      }
 #                  }
 #    }