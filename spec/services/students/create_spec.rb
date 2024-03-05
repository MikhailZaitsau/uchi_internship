# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Students::Create do
  describe 'call' do
    let(:params) { { first_name:, last_name:, surname:, class_id:, school_id: } }
    let(:group) { create(:group) }
    let(:school) { create(:school) }
    let(:first_name) { Faker::Name.first_name }
    let(:last_name) { 'Абдурахмангаджиевич' }
    let(:surname) { 'Мухобойников-Сыркин' }
    let(:class_id) { group.id }
    let(:school_id) { school.id }

    it 'create new student' do
      described_class.new.call(params.stringify_keys)
      expect(Student.last.first_name).to eq(first_name)
    end
  end
end
