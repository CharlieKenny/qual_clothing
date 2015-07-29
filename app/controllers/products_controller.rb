class ProductsController < ApplicationController

  def index
  end

  def male
    @products = Product.all
  end

end
