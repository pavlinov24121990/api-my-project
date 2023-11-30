# frozen_string_literal: true

module Api
  module V1
    class CompaniesController < ApplicationController
      def index
        company = Company.all.first
        return render json: company, each_serializer: CompanySerializer if company.present?

        render_errors(object: company)
      end
    end
  end
end
