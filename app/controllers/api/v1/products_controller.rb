# frozen_string_literal: true

module Api
  module V1
    class ProductsController < ApplicationController
      def index
        pagy, products = pagy(Product.all, items: 6)
        render json: {
          products: ActiveModelSerializers::SerializableResource.new(products, each_serializer: ProductSerializer),
          pages_count: pagy_metadata(pagy)[:pages]
        }
      end
    end
  end
end
