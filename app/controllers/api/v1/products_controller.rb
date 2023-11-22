module Api
  module V1
    class ProductsController < ApplicationController

      def index
        @products = Product.all
        render json: @products
      end

      def create
        @product = Product.new(params_product)
        render json: @product if @product.save
      end
      
      def params_product
        params.require(:product).permit(:title, :description, :price)
      end
    end
  end
end
