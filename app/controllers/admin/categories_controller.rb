class Admin::CategoriesController < ApplicationController
  layout 'admin'
  before_action :admin_required
  before_action :authenticate_user!

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:category_name, :quantity)
  end

end
