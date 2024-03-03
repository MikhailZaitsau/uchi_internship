# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Group do
  subject(:group) { described_class.create(params) }

  let(:params) { { number:, letter:, students_count: } }
  let(:number) { 1 }
  let(:letter) { 'D' }
  let(:students_count) { 15 }

  it 'create a group' do
    expect(group).to be_persisted
  end

  context 'when letter is cyrillic' do
    let(:letter) { 'Б' }

    it 'create a group' do
      expect(group).to be_persisted
    end
  end

  describe 'associations' do
    it { is_expected.to have_many(:students) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_numericality_of(:number).only_integer }
    it { is_expected.to validate_presence_of(:letter) }
    it { is_expected.to validate_length_of(:letter).is_equal_to(1) }
    it { is_expected.to validate_uniqueness_of(:number).scoped_to(:letter) }

    context 'when letter is empty' do
      let(:letter) { nil }

      it "doesn't create a group" do
        expect(group).not_to be_persisted
      end
    end

    context 'when letter is an integer' do
      let(:letter) { 5 }

      it "doesn't create a group" do
        expect(group).not_to be_persisted
      end
    end

    context 'when letter is not a letter' do
      let(:letter) { '5' }

      it "doesn't create a group" do
        expect(group).not_to be_persisted
      end
    end

    context 'when students_count is empty' do
      let(:students_count) { nil }

      it "doesn't create a group" do
        expect(group).not_to be_persisted
      end
    end

    context 'when students_count is not a number' do
      let(:students_count) { 'F' }

      it "doesn't create a group" do
        expect(group).not_to be_persisted
      end
    end

    context 'when students_count is not an integer' do
      let(:students_count) { 2.3 }

      it "doesn't create a group" do
        expect(group).not_to be_persisted
      end
    end
  end

  it { is_expected.to have_readonly_attribute(:id) }
  it { is_expected.to have_readonly_attribute(:students_count) }
end
