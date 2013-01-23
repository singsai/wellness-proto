#require 'pry'

class MembershipMailer < ActionMailer::Base
  default :from => "nick.tang@gmail.com"
  
  def reminder_email(week, email)
    mail(:to => email, :bcc => "nick.tang@gmail.com", :subject => "You are being reminded", 
    :content_type => "text/html", :body => "Your weight for Week ##{week} is empty. Please fill it.")
  end
end