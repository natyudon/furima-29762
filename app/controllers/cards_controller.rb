class CardsController < ApplicationController
  def new
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
   if card = Card.find_by(user_id: current_user.id)
   customer = Payjp::Customer.retrieve(card.customer_token)
   @card = customer.cards.first
   end
  end
  def create
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
   customer = Payjp::Customer.create(
   description: 'test', # テストカードであることを説明
   card: params[:token] # 登録しようとしているカード情報
   )
   
   @card = Card.new(
    card_token: params[:token], # カードトークン
    customer_token: customer.id, # 顧客トークン
    user_id: current_user.id # ログインしているユーザー
   )
   if params[:token] == nil
    flash[:notice] = "クレジットカード情報が正しくありません。"
    redirect_to new_card_path
   else
    if @card.save
     redirect_to root_path
    else
     flash[:notice] = "クレジットカード情報が正しくありません。"
     redirect_to new_card_path # カード登録画面
    end
   end
  end

end
