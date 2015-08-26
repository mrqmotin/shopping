class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = get_product
  end

private

  def get_product
    Product.where(id: params[:id]).first
  end
end
