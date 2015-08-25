class ProductsController < ApplicationController
  def index
  	@category = get_category
  	@products = @category.products
  end

  def show
  	@category = get_category
  	@product = get_product
  end

  def new
  	@category = get_category
  	@product = get_product
  end

  def edit
  	@category = get_category
  	@product = get_product
  end

  def create
  	@category = get_category
  	@product = @category.products.build(product_params)
  	if @product.save
  		redirect_to category_products_path(@category)
  	else
  		render :action => "new"
  	end

  end

  def update
  	@category = get_category
  	@product = get_product

  	if @product.update_attributes(product_params)
  		redirect_to category_products_path(@category)
  	else
  		render :edit
  	end
  end
  
  def destroy
  	@category = Category.find(params[:category_id])
  	@product = @category.products.find(params[:id])

  	if @product.destroy
  		redirect_to category_products_path(@category)
  	else
  		redirect_to category_products_path(@category)
  	end
  end

 private
 	def get_category
 		Category.find(params[:category_id])
 	end

 	def get_product
 		@category.products.find(params[:id])
 	end

  	def product_params
    params.require(:product).permit(:name, :price)
  	end	
end
