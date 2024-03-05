# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Student do
  subject(:student) { described_class.create(params) }

  let(:params) { { first_name:, last_name:, surname:, group_id:, school_id: } }
  let(:group) { create(:group) }
  let(:school) { create(:school) }
  let(:first_name) { 'Вячеслав' }
  let(:last_name) { 'Абдурахмангаджиевич' }
  let(:surname) { 'Мухобойников-Сыркин' }
  let(:group_id) { group.id }
  let(:school_id) { school.id }

  it 'create a student' do
    expect(student).to be_persisted
  end

  describe 'associations' do
    it { is_expected.to belong_to(:group) }
    it { is_expected.to belong_to(:school) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_length_of(:first_name).is_at_least(2).is_at_most(30) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_length_of(:last_name).is_at_least(2).is_at_most(30) }
    it { is_expected.to validate_presence_of(:surname) }
    it { is_expected.to validate_length_of(:surname).is_at_least(2).is_at_most(30) }
  end

  it { is_expected.to have_readonly_attribute(:id) }
end
