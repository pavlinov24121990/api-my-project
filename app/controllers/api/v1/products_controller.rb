# frozen_string_literal: true

module Api
  module V1
    class ProductsController < ApplicationController
      before_action :set_product, only: %i[show]
      
      def index
        pagy, products = pagy(Product.by_active(active).order(updated_at: :desc), items: 6)
        render json: {
          products: ActiveModelSerializers::SerializableResource.new(products, each_serializer: ProductSerializer),
          pages_count: pagy_metadata(pagy)[:pages]
        }
      end

      def show
        render json: ProductSerializer.new(@product).serializable_hash
      end

      private

      def active
        ActiveRecord::Type::Boolean.new.cast(params[:active])
      end

      def set_product
        @product = Product.find(params[:id])
      end
    end
  end
end
