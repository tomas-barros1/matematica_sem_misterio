class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch("MAILER_FROM", "escolajorgeamado@email.com")
  layout "mailer"
end
