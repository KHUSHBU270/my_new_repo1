class CheckoutController < ApplicationController
  def create
    # Find the product (or create one in the model)
    product = Product.find(params[:product_id])

    # Create a Stripe Checkout session
    session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'usd',
          product_data: {
            name: product.name,
          },
          unit_amount: product.price,  # Price in cents
        },
        quantity: 1,
      }],
      mode: 'payment',
      success_url: "#{root_url}success",
      cancel_url: "#{root_url}cancel",
    })

    # Redirect to Stripe Checkout
    redirect_to session.url, allow_other_host: true
  end
end
