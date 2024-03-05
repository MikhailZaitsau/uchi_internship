# frozen_string_literal: true

class AddUniqueIndexToGroups < ActiveRecord::Migration[7.1]
  def change
    add_index :groups, %i[number letter], unique: true
  end
end
