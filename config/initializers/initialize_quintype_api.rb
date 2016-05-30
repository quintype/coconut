require 'faraday/adapter/manticore'

Quintype::API::Client.establish_connection(Rails.configuration.publisher_config["api_host"], :manticore)
