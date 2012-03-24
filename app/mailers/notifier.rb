class Notifier < ActionMailer::Base
  default from: "abgriff@gmail.com"

  def order_received(order)
    @order = order

    mail to: order.email, :subect => "Pragmatic Store Order Confirmation"
  end

  def order_shipped
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
