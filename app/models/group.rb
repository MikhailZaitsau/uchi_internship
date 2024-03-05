# frozen_string_literal: true

class Group < ApplicationRecord
  has_many :students, dependent: :restrict_with_exception
  validates :number, uniqueness: { scope: :letter }, numericality: { only_integer: true }, presence: true
  validates :letter, length: { is: 1 }, format: { with: /[A-Za-zА-Яа-я]/ }, presence: true
  validates :students_count, numericality: { only_integer: true }, presence: true
  attr_readonly :id, :students_count
end
