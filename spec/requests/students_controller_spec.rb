# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'StudentsController' do
  describe 'POST /students' do
    let(:params) do
      { first_name: 'Вячеслав', last_name: 'Абдурахмангаджиевич',
        surname: 'Мухобойников-Сыркин', class_id: 1, school_id: 1 }
    end

    it 'creates a new student' do
      post('/students', params:)
      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /students/{user_id}' do
    let(:student_id) { create(student) }

    it 'delete an existing student' do
      delete("/student/#{student_id}")
      expect(Student.last.id).not_to eq(student.id)
    end
  end

  describe 'GET /schools/{school_id}/classes/{class_id}/students' do
    let(:school_id) { 1 }
    let(:class_id) { 2 }

    it 'get class students list' do
      get("/schools/#{school_id}/classes/#{class_id}/students")
      expect(response).to have_http_status(:ok)
    end
  end
end
