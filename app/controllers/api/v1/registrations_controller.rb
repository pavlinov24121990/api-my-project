# frozen_string_literal: true

module Api
  module V1
    class RegistrationsController < ApplicationController
      def create
        user = User.new(user_params)
        return render json: {
          user: ActiveModelSerializers::SerializableResource.new(user, each_serializer: UserSerializer),
          token: JsonWebToken.encode_token(user_id: user.id)
        } if user.save
        
        render_errors(object: user)
      end

      private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :phone, :name)
      end
    end
  end
end
