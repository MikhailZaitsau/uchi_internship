# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Students::Fetch do
  describe 'call' do
    before do
      create(:school)
      create(:group)
      3.times { create(:student, school_id: School.last.id, group_id: Group.last.id) }
    end

    it 'returns all students in class' do
      students = described_class.new.call(school_id: School.last.id, group_id: Group.last.id)
      expect(students.count).to eq(3)
    end
  end
end
