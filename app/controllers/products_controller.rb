class ProductsController < ApplicationController
  before_action :set_image
  def index
    @product = Product.where(buyer: "").limit(10).order('created_at DESC')
  end

  def new
    @parents = Category.all.order("id ASC").limit(13)
    @product = Product.new
    @product.images.build
  end

  
  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        params[:images][:image].each do |image|
          @product.images.create(image: image, product_id: @product.id)
        end
        format.html{redirect_to root_path}
      else
        @product.images.build
        format.html{render action: 'new'}
      end
    end
  end
  
  def edit
  end
  
  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def destroy
    @product.destroy
    redirect_to root_path
  end

  def confirm
    @product = Product.find(params[:id])
    @card = Credit.find_by(user_id: current_user.id)
  end

private

  def product_params
    params.require(:product).permit(:name, :detail, :size, :price, :condition, :shippingaddress, :shippingdate,  images_attributes: [:image, :_destroy, :id])
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_image
    @images = Image.last(10)
  end
  
end
