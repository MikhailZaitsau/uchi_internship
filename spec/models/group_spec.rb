# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Group, type: :model do
  subject(:student) { described_class.create(params) }

  let(:params) { { number: 1, letter: 'A' } }

  it 'create a student' do
    expect(student).to be_persisted
  end
end
