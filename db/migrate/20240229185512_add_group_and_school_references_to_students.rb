class AddGroupAndSchoolReferencesToStudents < ActiveRecord::Migration[7.1]
  def change
    add_reference :students, :group, null: false, foreign_key: true
    add_reference :students, :school, null: false, foreign_key: true
  end
end
