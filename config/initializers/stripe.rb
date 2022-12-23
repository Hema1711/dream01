Rails.configuration.stripe = {
  :publishable_key => 'pk_test_51MHLq2SIjir2ADXG97DQcuBR6CjwQYuU5Pu75W6hj2Q3ZW6LpzqDuox76sZVRzKl2xA95ktL9w7lbcLZS2lR1ftW00BSfQvMdn',
  :secret_key      => 'sk_test_51MHLq2SIjir2ADXGTdeNZ9xxs1wSLnudB3Cua5HzAXC69ORbrgDNSoB3Ueswlboz8tkT4iV1IraF7t2pZrgK7BXh00NgwAADQd'
}

Stripe.api_key = Rails.configuration.stripe[:pk_test_51MHLq2SIjir2ADXG97DQcuBR6CjwQYuU5Pu75W6hj2Q3ZW6LpzqDuox76sZVRzKl2xA95ktL9w7lbcLZS2lR1ftW00BSfQvMdn]






