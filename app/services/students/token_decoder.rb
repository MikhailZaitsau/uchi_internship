module Students
  class TokenDecoder
    def call(token)
      @token = token
      decoded_token
    end

    private

    def decoded_token
      JWT.decode(@token, Rails.application.credentials.secret_key_base, true, { algorithm: 'HS256' })
    end
  end
end