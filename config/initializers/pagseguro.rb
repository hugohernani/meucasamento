PagSeguro.configure do |config|
  config.token       = ENV['PAGSEGURO_TOKEN']
  config.email       = ENV['PAGSEGURO_EMAIL']
  config.environment = :production unless Rails.env.production?
end
