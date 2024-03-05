# frozen_string_literal: true

class School < ApplicationRecord
  has_many :groups, dependent: :restrict_with_exception
  has_many :students, through: :groups
end
