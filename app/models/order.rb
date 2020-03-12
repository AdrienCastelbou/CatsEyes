class Order < ApplicationRecord
  validates :address, presence: true
  after_create :order_user
  after_create :new_order_email
  has_many :cart_items, dependent: :destroy
  belongs_to :user
  belongs_to :cart

  def order_user
    UserMailer.order_user(self.user).deliver_now
  end

  def new_order_email
    AdminMailer.new_order_email(self.user).deliver_now
  end
end
