class CartsController < ApplicationController

  def index
    @cart = Cart.first_or_create
    if Cart.first.is_not_empty?
      @total = Cart.first.checkout
    end
  end

  def update
    @cart = Cart.first
    @promocode = params[:cart][:promocode]
    @cart.update_attributes(cart_params)
    @cart.apply_promocode(@promocode)
    redirect_to :back
  end

  def destroy
    product = Cart.first.products.find(params[:id])
    product.remove_from_cart
    Cart.first.products.destroy(params[:id])
    Cart.first.remove_promocode
    redirect_to carts_path
  end

  private

  def cart_params
    params.require(:cart).permit(:promocode)
  end


end
