# frozen_string_literal: true

module Api
  module V1
    module Admin
      class CompaniesController < ApplicationController
        def index
          company = Company.all.first
          return render json: company, each_serializer: CompanySerializer if company.present?

          render_errors(object: company)
        end

        def create
          company = Company.new(params_company)
          return render json: company, each_serializer: CompanySerializer if company.save

          render_errors(object: company)
        end

        private

        def params_company
          params.require(:company).permit(:title, :name, :phone, :description, :address, :email, :logo, images: [])
        end
      end
    end
  end
end
