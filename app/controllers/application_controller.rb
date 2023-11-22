class ApplicationController < ActionController::API
  include Pagy::Backend
  require 'pagy/extras/metadata'

class ApplicationController < ActionController::API
  def render_errors(object:)
    render json: { errors: object.errors.full_messages },
           status: :unprocessable_entity
  end
end
