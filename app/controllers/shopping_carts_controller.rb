class ShoppingCartsController < ApplicationController
  before_action :set_cart
  def index
    #カートに入っているすべての商品データ
    @user_cart_items = ShoppingCartItem.user_cart_items(@user_cart)
    #カートに入っている商品数
    @user_cart_items_count = ShoppingCartItem.user_cart_items(@user_cart).count
    #カートに入っている商品IDのリスト
    @user_cart_ids = ShoppingCartItem.user_cart_item_ids(@user_cart)
    #カートに入っている商品名のリスト
    @product_names = Product.in_cart_product_names(@user_cart_ids)
    #カートの合計金額
    @total = @user_cart.total
    
  end

  def show
    @cart = ShoppingCart.find(user_id: current_user)
  end

  def create
    @product = Product.find(product_params[:product_id])
    @user_cart.add(@product, product_params[:price].to_i, product_params[:quantity].to_i)
    redirect_to product_url(@product)
  end

  def update     
  end
 #以下のdestroyアクションでは、カート内の商品を注文する処理を行います。
 
  def destroy
    @user_cart.buy_flag = true
    @user_cart.save
    redirect_to cart_users_url
  end

  private
  def product_params
    params.permit(:product_id, :product, :price, :quantity)
  end
  def set_cart
    #まだ注文が確定していないカートのデータ
    @user_cart = ShoppingCart.set_user_cart(current_user)
  end
end