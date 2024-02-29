# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Student, type: :model do
  subject(:student) { described_class.create(params) }

  let(:group_id) { create(:group).id }
  let(:school_id) { create(:school).id }
  let(:params) do
    { first_name: 'Вячеслав', last_name: 'Абдурахмангаджиевич',
      surname: 'Мухобойников-Сыркин', group_id:, school_id: }
  end

  it 'create a student' do
    expect(student).to be_persisted
  end
end
