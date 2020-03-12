class AdminMailer < ApplicationMailer
  default from: 'acastelbou@outlook.fr'
  def new_order_email(user)
    @user = user
    @cart = user.cart
    @url  = 'https://catseyes.herokuapp.com/'
    mail(to: User.find_by(admin: true).email, subject: 'Commande effectuée')
  end
end
