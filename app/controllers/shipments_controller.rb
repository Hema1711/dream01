class ShipmentsController < ApplicationController

  require 'fedex'


        def shipment_index
        end


        def create
          byebug
          # Set up FedEx client
          fedex = Fedex::Shipment.new(
            :key => "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6WyJDWFMiXSwiUGF5bG9hZCI6eyJjbGllbnRJZGVudGl0eSI6eyJjbGllbnRLZXkiOiJsN2YxYzFkMjMzMDA0YzQ3MTc5NTcwZGY3Y2FjOGEwOTA1In0sImF1dGhlbnRpY2F0aW9uUmVhbG0iOiJDTUFDIiwiYWRkaXRpb25hbElkZW50aXR5Ijp7InRpbWVTdGFtcCI6IjA3LU1hci0yMDIzIDA4OjA1OjI0IEVTVCIsImdyYW50X3R5cGUiOiJjbGllbnRfY3JlZGVudGlhbHMiLCJhcGltb2RlIjoiU2FuZGJveCIsImN4c0lzcyI6Imh0dHBzOi8vY3hzYXV0aHNlcnZlci1zdGFnaW5nLmFwcC5wYWFzLmZlZGV4LmNvbS90b2tlbi9vYXV0aDIifSwicGVyc29uYVR5cGUiOiJEaXJlY3RJbnRlZ3JhdG9yX0IyQiJ9LCJleHAiOjE2NzgxOTc5MjQsImp0aSI6IjhiODJlZDU2LWM5NDItNGNiYy04YWQ2LTJjNGFjZWIzOTNkZiJ9.V7ICawxEsc-CDuIqHehSuB42ugUratp3EUAqb-dx5Ame7pyxnJZraIhPAHmKiMOaiheU2HKIosuF0YkrZ-9FT5lu644QwAmTVDbS2Vs7yLP9e97SZE8UZYkXP0xQucSND4V2IMQZ_WPMEt9jXizXsCHV3k0EyCZi0KxAzczwQVKKtNz9CKXjBn29AignaDfyKSKPuCkZ2HT5YBX2vDPZ2cMVfkpYGa5lNItAMyVuB8MkWIyv8YA75qvjgefPNQrWb_FTbzfru3j_PyuwegGU8vkFJiPXXmnV1UmLSzbhh4zxNFkMer_BJDiJAYEFGFVqQAxeKZyoXRISVUp5ErapYm47sPgnB3IviWdExOJz3jo0meJjKgmY3rw5CyC6PuMu0UCPgADx6VIGFu6qp99rgR0MNgVau_O9OE_rYRur65FV5ebd9bQsvLSEKRUV7e357P8fpakLQrhb3-c9ZRXf-uvAIynE08AEAppJvQLOmb0A4F_-oIpMJd2lUVZ1DSnNQiUr2drm6JKXql9kn7FOvoWtSskENq09fLycT9uTy4cmJO8_JA7yPyVWsmOClmNHK3Kph0bXfPjHs8QuSsXbUk3hzHv0VKRC1cOAr5u7OIZlUdVE39lKGbl1EC2mVac8pCrhHHFOYqECEOkFE169i06BFb7cJANP7loTv3MrrZc",
            :password => 'YOUR_PASSWORD',
            :account_number => 'YOUR_ACCOUNT_NUMBER',
            :meter => 'YOUR_METER_NUMBER',
            :mode => 'test'
          )
      
          # Create shipment
          shipment = fedex.shipment(
            :shipper => {
              :name => 'Sender Name',
              :company => 'Sender Company',
              :phone_number => '555-555-5555',
              :address => {
                :line1 => '1234 Main St',
                :city => 'Anytown',
                :state => 'IL',
                :postal_code => '12345',
                :country_code => 'US'
              }
            },
            :recipient => {
              :name => 'Recipient Name',
              :company => 'Recipient Company',
              :phone_number => '555-555-5555',
              :address => {
                :line1 => '5678 Main St',
                :city => 'Anytown',
                :state => 'IL',
                :postal_code => '54321',
                :country_code => 'US'
              }
            },
            :packages => [
              {
                :weight => { :units => 'LB', :value => 10 },
                :dimensions => { :length => 10, :width => 10, :height => 10, :units => 'IN' }
              }
            ]
          )
      
          # Generate airway bill
          airway_bill = fedex.generate_shipping_document(:shipment => shipment, :type => 'AIR_WAYBILL')
      
          # Do something with airway bill (e.g. save to database, display to user)
          # ...
      
          # Redirect to a confirmation page
          redirect_to confirmation_path
        end


        def shipment_confirmation
          # Get the airway bill from the database or wherever you saved it
          airway_bill = # ...
      
          # Get any other relevant information that you want to display on the confirmation page
          # ...
      
          # Render the confirmation page
          render :shipment_confirmation, locals: { airway_bill: airway_bill, other_info: other_info }
        end

      
end
