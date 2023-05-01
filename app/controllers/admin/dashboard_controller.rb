class Admin::ProductsController < ApplicationController
  http_basic_authenticate_with :name => ENV["USERNAME"], :password => ENV["PASSWORD"]

  def index
    @products = Product.order(id: :desc).all
@@ -12,7 +13,7 @@ def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to [:admin, :products], notice: "Product created!"
    else
      render :new
    end
@@ -21,7 +22,7 @@ def create
  def destroy
    @product = Product.find params[:id]
    @product.destroy
    redirect_to [:admin, :products], notice: "Product deleted!"
  end

  private
  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :category_id,
      :quantity,
      :image,
      :price
    )
  end

end