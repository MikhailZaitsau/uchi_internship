# frozen_string_literal: true

class Student < ApplicationRecord
  belongs_to :group # , counter_cache: true # conflict with readonly requirements to 'students count'
  belongs_to :school
  validates :first_name, :last_name, :surname, length: { in: 2..30 }, presence: true
  attr_readonly :id
end
