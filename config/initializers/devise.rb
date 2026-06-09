Devise.setup do |config|
  config.mailer_sender = "nao-responda@matematica-sem-misterio.test"
  config.parent_controller = "ApplicationController"
  config.scoped_views = true
  config.navigational_formats = [ "*/*", :html, :turbo_stream ]
  config.strip_whitespace_keys = [ :email ]
end
