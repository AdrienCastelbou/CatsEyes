class AdminMailer < ApplicationMailer
  default from: 'acastelbou@outlook.fr'
  def new_order_email(user)
    @user = user
    @cart = user.cart
    @url  = 'https://catseyes.herokuapp.com/'
    mail(to: "admin@yopmail.com", subject: 'Commande effectuée')
  end
end
