# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Students::Destroy do
  describe 'call' do
    before { create(:student) }

    let!(:student) { create(:student) }

    it 'delete existed student' do
      described_class.new.call(student.id)
      expect(Student.last.id).not_to eq(student.id)
    end

    context "when student doesn't exist" do
      it 'returns false' do
        result = described_class.new.call(999)
        expect(result).to be_falsy
      end
    end
  end
end
