class CartsController < ApplicationController

  def destroy
  product = Cart.first.products.find(params[:id])
  product.remove_from_cart
  Cart.first.products.destroy(params[:id])
  redirect_to carts_path
  end
end
