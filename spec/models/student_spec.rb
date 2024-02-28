# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Student do
  subject(:student) { described_class.create(params:) }

  let(:params) do
    { first_name: 'Вячеслав', last_name: 'Абдурахмангаджиевич',
      surname: 'Мухобойников-Сыркин', class_id: 1, school_id: 1 }
  end

  it 'create a student' do
    expect(student).to be_persisted
  end
end
