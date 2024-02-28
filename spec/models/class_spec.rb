# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Student do
  subject(:student) { described_class.create(params:) }

  let(:params) { { nimber: '1', letter: 'А' } }

  it 'create a student' do
    expect(student).to be_persisted
  end
end
