# frozen_string_literal: true

class AddGroupAndSchoolReferencesToStudents < ActiveRecord::Migration[7.1]
  def change
    add_reference :students, :group, foreign_key: true
    add_reference :students, :school, foreign_key: true
  end
end
