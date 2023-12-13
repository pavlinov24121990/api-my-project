# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ApplicationController
      def create
        user = User.find_by(email: params[:user][:email])
        return render json: {
          token: JsonWebToken.encode_token(user_id: user.id)
        } if user && user.authenticate(params[:user][:password])
        
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end
  end
end
