class Api::V1::ProductsController < ApplicationController
  def index
    @products = Product.all
    render json: @products, each_serializer: ProductSerializer
  end

  def create
    @product = Product.new(params_product)
    return render json: @product, each_serializer: ProductSerializer if @product.save
    return render_errors(object: @product) unless @product.save
  end
  
  def params_product
    params.require(:product).permit(:title, :description, :price)
  end
end
