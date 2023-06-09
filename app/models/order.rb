class Order < ApplicationRecord

  # 会員
  belongs_to :customer

  # カート内商品
  has_many :order_details, dependent: :destroy

  enum payment_method: { credit_card: 0,transfer: 1 }
  enum status: { waiting_for_payment: 0, payment_confirmation: 1, in_production: 2, preparing_to_ship: 3, sent: 4 }

  def subtotal
    sum = 0
    order_details.each do |order_detail|
      sum += order_detail.price * order_detail.amount
    end
    sum
  end

end