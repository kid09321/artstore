class ProductsController < ApplicationController
  def index
    @productsPerPage = 20
    @totalpage = ((Product.count.to_f)/@productsPerPage.to_f).ceil
    if params[:search]
       @search = true #當有搜尋關鍵字時
       @totalpage = ((Product.where('title LIKE ?', "%#{params[:search]}%").count.to_f/@productsPerPage.to_f).ceil)
       #搜尋到的總筆數
       @key = params[:search] #把剛剛用戶搜尋的關鍵字指派給@key變數(保留住)
      if params[:searchpage]
        @products = Product.where('title LIKE ?', "%#{params[:search]}%").limit(20).offset(params[:searchpage].to_i * @productsPerPage - 2) #
      else
        @products = Product.where('title LIKE ?', "%#{params[:search]}%").limit(20).offset(0)
      end
    elsif params[:page]
      @products = Product.limit(20).offset(params[:page].to_i * @productsPerPage - 2)   #根據傳入的頁數值分頁
    else
      @products = Product.all.limit(20).offset(0) #預設第一頁(從最一開始顯示兩筆)
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.items.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "成功加入購物車"
    else
      flash[:alert] = "此商品之前已加入過購物車"
    end
    redirect_to product_path(@product)
  end
end
