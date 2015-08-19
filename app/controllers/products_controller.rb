class ProductsController < ApplicationController

  def index
  end

  def mens
    @products = Product.all
  end

  def womens
    @products = Product.all
  end

  def update
    product = Product.find(params[:id])
    product.add_to_cart
    cart = Cart.first_or_create
    cart.products << product
    redirect_to mens_product_path
  end

  

end
