class CardsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_payjp_key, except: :new
  before_action :block_has_card_user, only: [:new, :create]

  def index
    if current_user.card.present?
      @cards = Card.find_by(user_id: current_user.id)
    end
  end

  def new
  end

  def create
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
  end

  def block_has_card_user
    redirect_to cards_path, alert: "既にカード情報を登録しているので、追加できません" if current_user.card.present?
  end

end
