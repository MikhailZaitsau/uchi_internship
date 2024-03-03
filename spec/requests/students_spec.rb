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
  end

  describe 'DELETE /students/{user_id}' do
    before { create(:student) }

    let!(:student) { create(:student) }

    it 'delete an existing student' do
      delete("/students/#{student.id}")
      expect(Student.last.id).not_to eq(student.id)
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
  end
end
