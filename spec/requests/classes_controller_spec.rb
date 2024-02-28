# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ClassesController' do
  describe 'GET /schools/{school_id}/classes' do
    let(:class_id) { 2 }

    it 'get class list' do
      get("/schools/#{school_id}/classes")
      expect(response).to have_http_status(:ok)
    end
  end
end
