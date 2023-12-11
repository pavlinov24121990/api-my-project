# frozen_string_literal: true

module Api
  module V1
    module Admin
      class ProductsController < AdminController
        before_action :set_product, only: %i[show destroy update]
        def index
          pagy, products = pagy(params[:active] == 'true' ? Product.active_true : Product.active_false, items: 6)
          render json: {
            products: ActiveModelSerializers::SerializableResource.new(products, each_serializer: ProductSerializer),
            pages_count: pagy_metadata(pagy)[:pages]
          }
        end

        def show
          return render json: @product, each_serializer: ProductSerializer if @product

          render_errors(object: @product)
        end

        def create
          product = Product.new(params_product)
          return render json: product, each_serializer: ProductSerializer if product.save

          render_errors(object: product)
        end

        def update
          return render json: @product, each_serializer: ProductSerializer if @product.update(params_product)

          render_errors(object: @product)
        end

        def destroy
          render_errors(object: @product) unless @product.destroy
        end

        private

        def params_product
          params.require(:product).permit(:title, :description, :price, :active, images: [])
        end

        def set_product
          @product = Product.find(params[:id])
        end
      end
    end
  end
end
