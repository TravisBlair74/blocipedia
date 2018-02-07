class ChargesController < ApplicationController
  def create
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: 15_00,
      description: "BigMoney Membership - #{current_user.email}",
      currency: 'usd'
    )

    flash[:notice] = "Thanks for the payment, #{current_user.email}!"
    current_user.premium!
    redirect_to wikis_path

    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to wikis_path
  end

  def downgrade
    current_user.member!

    current_user.wikis.each do |wiki|
      wiki.update(private: false)
    end

    flash[:notice] = "Your account has been downgraded.  All private Wikis are now public!"
    redirect_to wikis_path
  end

  def new
  @stripe_btn_data = {
    key: "#{ Rails.configuration.stripe[:publishable_key] }",
    description: "BigMoney Membership - #{current_user.email}",
    amount: 15_00
  }
  end
end
