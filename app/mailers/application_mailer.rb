class ApplicationMailer < ActionMailer::Base
  def message
  	@user = user
  	@url = 'http://www.skoosm.com'
    mail(
      :subject => 'Hello from Postmark',
      :to  => 'rchelton@umd.edu',
      :from => 'rchelton@skoosm.com',
      :html_body => '<strong>Hello</strong> dear Postmark user.',
      :track_opens => 'true')
  end

  def confirmation_instructions(user)
  	@user = user
  	@url = 'http://www.skoosm.com'
  	mail(
  		:subject => 'Welcome to Skoosm!',
  		:to => user.email,
  		:from => 'rchelton@skoosm.com')
  end
end
