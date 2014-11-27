class UserMailer < ActionMailer::Base
  default from: "admin@thinkingremote.com"
   
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to ThinkingRemote')
  end
  
end
