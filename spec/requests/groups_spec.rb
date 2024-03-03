# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ClassesController' do
  describe 'GET /schools/{school_id}/classes' do
    before do
      create(:school)
      create_list(:group, 2)
      create(:student, group_id: Group.first.id, school_id: School.first.id)
      create(:student, group_id: Group.last.id, school_id: School.first.id)
    end

    it 'get class list' do
      get("/schools/#{School.first.id}/classes")
      expect(response).to have_http_status(:ok)
    end
  end
end
