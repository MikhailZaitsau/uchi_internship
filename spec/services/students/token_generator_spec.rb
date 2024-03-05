# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Students::TokenGenerator do
  describe 'call' do
    it 'generate valid token' do
      token = described_class.new.call(999)
      expect(JWT.decode(token, Rails.application.credentials.secret_key_base,
                        true, { algorithm: 'HS256' })[0]).to eq(999)
    end
  end
end
