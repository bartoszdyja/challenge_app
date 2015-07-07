class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  

  def accept_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: "to@example.com", subject: 'Your answer has been accepted')
  end
end
