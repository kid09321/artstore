class Admin::SizesController < ApplicationController
  before_action :admin_required
  before_action :authenticate_user!
  layout 'admin'
  def new
    @product = Product.find(params[:product_id])
    @size = @product.sizes.build
  end
  def create
    @product = Product.find(params[:product_id])
    @size = @product.sizes.build(size_params)

    if @size.save
      redirect_to admin_product_path(@product)
    else
      render :new
  end
end

  def edit
    @product = Product.find(params[:product_id])
    @size = @product.sizes.find(params[:id])
  end

  def update
    @product = Product.find(params[:product_id])
    @size = @product.sizes.find(params[:id])

    if @size.update(size_params)
      redirect_to admin_product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product=Product.find(params[:product_id])
    @size = @product.sizes.find(params[:id])
    @size.destroy
    redirect_to admin_product_path(@product)
  end
  private

  def size_params
    params.require(:size).permit(:size, :quantity)
  end
end
