class UserMailer < ActionMailer::Base
  default :from => "notifications@example.com"

  def welcome_email(user)
    @user = user
    attachments["NuestrosPrecios.png"] = File.read("#{Rails.root}/app/assets/images/logo2.png")
    mail(:to => user.email, :subject => "Bienvenido a Nuestros Precios")
  end
end
