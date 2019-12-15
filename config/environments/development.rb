Rails.application.configure do
  
  config.hosts.clear

  # Do not eager load code on boot.
  config.eager_load = false
  
  config.action_mailer.raise_delivery_errors = false
  
  config.action_mailer.perform_deliveries = true
  
  host = '3039f0e5e29746ec9688a99e559d1df0.vfs.cloud9.us-east-2.amazonaws.com'
  config.action_mailer.default_url_options = { host: host, port: 3000 }

end
