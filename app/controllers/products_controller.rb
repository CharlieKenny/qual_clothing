class ProductsController < ApplicationController

  def index
    @mensproducts = Product.all.select {|product| product.category.include? "Men" } 
    @womensproducts = Product.all.select {|product| product.category.include? "Women" }
    params["dept"] ||= "index"
    render params["dept"]
  end

  def mens
    @mensproducts
  end

  def womens
    @womensproducts
  end

  def update
    product = Product.find(params[:id])
    product.add_to_cart
    cart = Cart.first_or_create
    cart.products << product
    redirect_to(:back)
  end

  

end
