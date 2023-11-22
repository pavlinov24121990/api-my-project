module Api
  module V1
    class ProductsController < ApplicationController

      # :swagger: :get
      # Список продуктов
      #
      # Получение списка всех продуктов
      #
      # :swagger: :response
      # @return [Array<Product>] Список продуктов
      def index
        @products = Product.all
        render json: @products
      end

      def create
      end

    end
  end
end
