module JsonWebToken
  module_function

  def encode_token(payload)
    JWT.encode(payload, Rails.application.secret_key_base)
  end
end
