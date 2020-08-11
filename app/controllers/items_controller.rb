class ItemsController < ApplicationController
  def index
  end

  def show
  end
  
  def new
  end

  def pay
    Payjp.api_key = "sk_test_b41785077f73783a884dc4d4"
    Payjp::Charge.create(
      amount: 20000, # 決済する値段
      card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
      currency: 'jpy'
    )
  end
end
