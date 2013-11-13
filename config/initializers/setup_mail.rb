ActionMailer::Base.smtp_settings = { :address   => "smtp.sendgrid.net",
                           :port      => 587,
                           :domain    => "arcane-springs-5301.herokuapp.com",
                           :user_name => "no-reply@arcane-springs-5301.herokuapp.com",
                           :authentication => 'plain',
                           :enable_starttls_auto => true 
                           }
