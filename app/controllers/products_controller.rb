class ProductsController < ApplicationController

  def index
  end

  def mens
    @products = Product.all
  end

  def womens
    @products = Product.all
  end

end
