class ProductsController < ApplicationController
  def index
    @products = Product.last(10)
  end

  def new
    
  end
end
