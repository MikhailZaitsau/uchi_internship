# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Groups::Fetch do
  describe 'call' do
    before do
      create(:school)
      create_list(:group, 2)
      create(:student, group_id: Group.first.id, school_id: School.first.id)
      create(:student, group_id: Group.last.id, school_id: School.first.id)
    end

    it 'returns all groups in school' do
      groups = described_class.new.call(School.first.id)
      expect(groups.count).to eq(2)
    end
  end
end
