class UserMailer < ActionMailer::Base
  default from: "admin@thinkingremote.com"
   
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'You just got 5.6% closer to the rest of the world')
  end
  
end
