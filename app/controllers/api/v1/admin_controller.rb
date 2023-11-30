# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :authenticate_user

  protected

  def authenticate_user
    super
    head :bad_request unless @current_user.admin?
  end
end
