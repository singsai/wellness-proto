#require 'pry'

class MembershipMailer < ActionMailer::Base
  default :from => "nick.tang@gmail.com"
  
  def reminder_email(week, email)
    mail(:to => email, :bcc => "nick.tang@gmail.com", :subject => "You are being reminded", 
    :content_type => "text/html", :body => "Your weight for Week ##{week} is empty. Please fill it.")
  end
  
  def registration_email(email, shib)
    mail(:to => email, :bcc => "nick.tang@gmail.com", :subject => "You have just been registered", 
    :content_type => "text/html", :body => "You can log in with your email and secret word: #{shib}")
  end
end