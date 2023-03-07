require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Dream
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # config.active_record.schema_format = :sql

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end

  {
    "access_token": "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6WyJDWFMiXSwiUGF5bG9hZCI6eyJjbGllbnRJZGVudGl0eSI6eyJjbGllbnRLZXkiOiJsN2YxYzFkMjMzMDA0YzQ3MTc5NTcwZGY3Y2FjOGEwOTA1In0sImF1dGhlbnRpY2F0aW9uUmVhbG0iOiJDTUFDIiwiYWRkaXRpb25hbElkZW50aXR5Ijp7InRpbWVTdGFtcCI6IjA3LU1hci0yMDIzIDA4OjA1OjI0IEVTVCIsImdyYW50X3R5cGUiOiJjbGllbnRfY3JlZGVudGlhbHMiLCJhcGltb2RlIjoiU2FuZGJveCIsImN4c0lzcyI6Imh0dHBzOi8vY3hzYXV0aHNlcnZlci1zdGFnaW5nLmFwcC5wYWFzLmZlZGV4LmNvbS90b2tlbi9vYXV0aDIifSwicGVyc29uYVR5cGUiOiJEaXJlY3RJbnRlZ3JhdG9yX0IyQiJ9LCJleHAiOjE2NzgxOTc5MjQsImp0aSI6IjhiODJlZDU2LWM5NDItNGNiYy04YWQ2LTJjNGFjZWIzOTNkZiJ9.V7ICawxEsc-CDuIqHehSuB42ugUratp3EUAqb-dx5Ame7pyxnJZraIhPAHmKiMOaiheU2HKIosuF0YkrZ-9FT5lu644QwAmTVDbS2Vs7yLP9e97SZE8UZYkXP0xQucSND4V2IMQZ_WPMEt9jXizXsCHV3k0EyCZi0KxAzczwQVKKtNz9CKXjBn29AignaDfyKSKPuCkZ2HT5YBX2vDPZ2cMVfkpYGa5lNItAMyVuB8MkWIyv8YA75qvjgefPNQrWb_FTbzfru3j_PyuwegGU8vkFJiPXXmnV1UmLSzbhh4zxNFkMer_BJDiJAYEFGFVqQAxeKZyoXRISVUp5ErapYm47sPgnB3IviWdExOJz3jo0meJjKgmY3rw5CyC6PuMu0UCPgADx6VIGFu6qp99rgR0MNgVau_O9OE_rYRur65FV5ebd9bQsvLSEKRUV7e357P8fpakLQrhb3-c9ZRXf-uvAIynE08AEAppJvQLOmb0A4F_-oIpMJd2lUVZ1DSnNQiUr2drm6JKXql9kn7FOvoWtSskENq09fLycT9uTy4cmJO8_JA7yPyVWsmOClmNHK3Kph0bXfPjHs8QuSsXbUk3hzHv0VKRC1cOAr5u7OIZlUdVE39lKGbl1EC2mVac8pCrhHHFOYqECEOkFE169i06BFb7cJANP7loTv3MrrZc",,
    "token_type": "bearer",
    "expires_in": 3600,
    "scope": "CXS"
  }
end
