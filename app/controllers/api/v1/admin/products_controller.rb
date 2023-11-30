# frozen_string_literal: true

module Api
  module V1
    module Admin
      class ProductsController < AdminController
        def index
          pagy, products = pagy(Product.all, items: 6)
          render json: {
            products: ActiveModelSerializers::SerializableResource.new(products, each_serializer: ProductSerializer),
            pages_count: pagy_metadata(pagy)[:pages]
          }
        end

        def create
          product = Product.new(params_product)
          return render json: product, each_serializer: ProductSerializer if product.save

          render_errors(object: product)
        end

        private

        def params_product
          params.require(:product).permit(:title, :description, :price, images: [])
        end
      end
    end
  end
end
