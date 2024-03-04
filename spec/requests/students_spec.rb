# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'StudentsController' do
  describe 'POST /students' do
    let(:params) { { first_name:, last_name:, surname:, group_id:, school_id: } }
    let(:group) { create(:group) }
    let(:school) { create(:school) }
    let(:first_name) { 'Вячеслав' }
    let(:last_name) { 'Абдурахмангаджиевич' }
    let(:surname) { 'Мухобойников-Сыркин' }
    let(:group_id) { group.id }
    let(:school_id) { school.id }

    it 'creates a new student' do
      post('/students', params:)
      expect(response).to have_http_status(:created)
    end

    it 'returns valid X-Auth-Token token' do
      post('/students', params:)
      expect(response.headers['X-Auth-Token'])
        .to eq(JWT.encode(response.parsed_body[:id], Rails.application.credentials.secret_key_base, 'HS256'))
    end

    context 'when params are incorrect' do
      let(:first_name) { nil }

      it "doesn't creates a new student" do
        post('/students', params:)
        expect(response).to have_http_status(:method_not_allowed)
      end
    end
  end

  describe 'DELETE /students/{user_id}' do
    before { create(:student) }

    let!(:student) { create(:student) }
    let(:token) { JWT.encode(student.id, Rails.application.credentials.secret_key_base, 'HS256') }
    let(:headers) { { 'X-Auth-Token' => token } }


    it 'delete an existing student' do
      delete("/students/#{student.id}", headers:)
      expect(Student.last.id).not_to eq(student.id)
    end

    context "when student doesn't exist" do
      let(:token) { JWT.encode(999, Rails.application.credentials.secret_key_base, 'HS256') }

      it 'returns an error' do
        delete('/students/999', headers:)
        expect(response).to have_http_status(:bad_request)
      end
    end

    context 'when X-Auth-Token are not valid' do
      let(:token) { JWT.encode(student.id + 1, Rails.application.credentials.secret_key_base, 'HS256') }

      it 'returns unauthorized' do
        delete("/students/#{student.id}", headers:)
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'GET /schools/{school_id}/classes/{class_id}/students' do
    before do
      create(:school)
      create(:group)
      3.times { create(:student, school_id: School.last.id, group_id: Group.last.id) }
    end

    it 'get class students list' do
      get("/schools/#{School.last.id}/classes/#{Group.last.id}/students")
      expect(response).to have_http_status(:ok)
    end

    context 'when students are not found' do
      let(:school) { create(:school) }
      let(:group) { create(:group) }

      it 'returns no content' do
        get("/schools/#{school.id}/classes/#{group.id}/students")
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
