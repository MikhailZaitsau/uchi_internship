module Students
  class TokenGenerator
    def call(student_id)
      @student_id = student_id
      token
    end

    private

    def token
      JWT.encode(@student_id, Rails.application.credentials.secret_key_base, 'HS256')
    end
  end
end