require 'active_record'
require 'twitter'

Twitter.configure do |config|
  config.consumer_key = "oXMfGnqzlwmRNLnZTNNo6Q"
  config.consumer_secret = "D9Q3i1rCBAzQfDvfSywlWbvEHux8zzvQIgJWGCjBk2w"
  config.oauth_token = "38060080-AN6be1iwIX6LvPErjsh8tXrPckBtqetCBu2nfveOY"
  config.oauth_token_secret = "MH6TCGPmBNfuO2gkE9wHCRM9QACID0zIFf7nUXkXA"
end
