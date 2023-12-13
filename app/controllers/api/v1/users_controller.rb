# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user, only: %i[show]
      
      def show
        render json: UserSerializer.new(@current_user).serializable_hash
      end
    end
  end
end
