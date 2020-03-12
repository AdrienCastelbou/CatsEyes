class Order < ApplicationRecord
  after_create :order_user
  after_create :new_order_email
  has_many :cart_items, dependent: :destroy
  belongs_to :user
  belongs_to :cart
end
