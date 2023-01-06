# Rails.configuration.stripe = {
#   :publishable_key => "pk_test_51MJF8dSCMsqXkSzwSIxyVR9WFUsCsz7Qi9rh5tgDCF4mXRYoBBkNsj7CmHC6Zo68fEh6aCOg5hck68qvM40huMEt00YnluTa4g",
#   :secret_key      => "sk_test_51MJF8dSCMsqXkSzwWNezaogjmUR5axcQav1YNcL9MxuA3sDtfu3rM45ksFBupyicUSMWnXL8OwkZwo6gIiAEHS2i00C50ITW9O"
# }

# Stripe.api_key = Rails.configuration.stripe[:sk_test_51MJF8dSCMsqXkSzwWNezaogjmUR5axcQav1YNcL9MxuA3sDtfu3rM45ksFBupyicUSMWnXL8OwkZwo6gIiAEHS2i00C50ITW9O]


Rails.configuration.stripe = {
    :publishable_key => ENV['PUBLISHABLE_KEY'],
    :secret_key      => ENV['SECRET_KEY']
  }
  
  Stripe.api_key = Rails.configuration.stripe[:secret_key]