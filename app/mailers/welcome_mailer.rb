class WelcomeMailer < ApplicationMailer
  default from: 'testvaibhav07@gmail.com'
    def welcome_email
        @user = params[:user]
        @url = 'http://localhost:3000/sign_in'
        mail(to: @user.email, subject: 'Welcome to Online Grocery')
      end
end
