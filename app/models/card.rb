class Card < ApplicationRecord
  belongs_to :user, optional: true

  # require 'payjp'
  #   Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)

  # def self.create_card_to_payjp(params)
  #   #トークンを作成
  #   token = Payjp::Token.create({
  #     card: {
  #       number:     params['number'],
  #       cvc:        params['cvc'],
  #       exp_month:  params['exp_month'],
  #       exp_year:   params['exp_year']
  #     }},
  #     {'X-Payjp-Direct-Token-Generate': 'true'} 
  #   )
  #   # 上記で作成したトークンをもとに顧客情報を作成
  #   Payjp::Customer.create(card: token.id)
  # end

end
