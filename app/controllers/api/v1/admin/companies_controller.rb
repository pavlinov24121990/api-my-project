# frozen_string_literal: true

module Api
  module V1
    module Admin
      class CompaniesController < AdminController
        before_action :set_company, only: %i[update]
        
        def index
          company = Company.all.first
          return render json: company, each_serializer: CompanySerializer if company.present?

          render_errors(object: company)
        end

        def update
          return render json: @company, each_serializer: CompanySerializer if @company.update(params_company)

          render_errors(object: @company)
        end

        private

        def params_company
          params.require(:company).permit(:title, :name, :phone, :description, :address, :email, :logo, images: [])
        end

        def set_company
          @company = Company.find(params[:id])
        end
      end
    end
  end
end
