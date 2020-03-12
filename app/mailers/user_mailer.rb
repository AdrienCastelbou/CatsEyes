class UserMailer < ApplicationMailer
  default from: 'acastelbou@outlook.fr'

  def welcome_email(user)
    @user = user 
    @url  = 'https://catseyes.herokuapp.com/'
    mail(to: @user.email, subject: 'Bienvenue sur CatsEyes !')
  end

  def order_user(user)
    @user = user
    @url  = 'https://catseyes.herokuapp.com/'
    mail(to: @user.email, subject: 'Merci pour votre achat !')
  end
end
