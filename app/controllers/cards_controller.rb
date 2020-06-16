class CardsController < ApplicationController
  skip_before_action :verify_authenticity_token
<<<<<<< Updated upstream
  before_action :set_payjp_key, except: :new

  def index
    if current_user.card.present?
      @cards = Card.where(user_id: current_user.id)
=======

  def index
    if current_user.card.present?
      @cards = current_user.card
      # @customer = Payjp::Customer.retrieve(@card.customer_id)
      # @default_card_information = @customer.cards.retrieve(@card.card_id)
>>>>>>> Stashed changes
    end
  end

  def new
  end

  def create
<<<<<<< Updated upstream
    if params[:payjp_token]
      customer = Payjp::Customer.create(card: params[:payjp_token])
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      @card.save
      redirect_to cards_path
    end
  end

  def destroy
    card = Card.find(params[:id])
    customer = Payjp::Customer.retrieve(card.customer_id)
    customer.delete
    card.delete
    redirect_to cards_path
  end
  
  private

  def set_payjp_key
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
=======
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
    if params[:payjp_token].blank?
      render :new
    else 
      customer = Payjp::Customer.create(card: params[:payjp_token])
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "index"
      else
        render :new
      end
    end
  end

  def show
  end


  def destroy

>>>>>>> Stashed changes
  end

end
