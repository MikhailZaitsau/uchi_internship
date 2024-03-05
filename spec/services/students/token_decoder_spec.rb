# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Students::TokenDecoder do
  describe 'call' do
    let(:token) { JWT.encode(999, Rails.application.credentials.secret_key_base, 'HS256') }

    it 'correct decode valid token' do
      decoded_id = described_class.new.call(token)[0]
      expect(decoded_id).to eq(999)
    end
  end
end
