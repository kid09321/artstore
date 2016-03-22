module ProductsHelper
  def render_page
    if !@search
      for page in 1..@totalpage
        if @totalpage >1
          link_to(page, products_path(page: page))
        else
          page
        end
      end
    else
      for page in 1..@totalpage
        if @totalpage >1
          link_to(page, products_path(searchpage: page, search: @key))
        else
          page
        end
      end
    end
  end
end
