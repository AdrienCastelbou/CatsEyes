class ItemCart < ApplicationRecord
  belongs_to :cart
  belongs_to :item
  belongs_to :order

  def total_price
    item.price.to_i * quantity.to_i
  end
end
