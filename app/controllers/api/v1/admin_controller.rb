# frozen_string_literal: true

class AdminController < ActionController::API
  before_action :current_userr, :authenticate_admin!

  def authenticate_admin!
    head :bad_request unless @user.admin?
  end
end
