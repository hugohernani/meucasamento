PagSeguro.configure do |config|
  config.token       = ENV['PAGSEGURO_TOKEN']
  config.email       = ENV['PAGSEGURO_EMAIL']
  config.environment = Rails.env.production?? :production : :sandbox
  config.encoding    = "UTF-8"
end
