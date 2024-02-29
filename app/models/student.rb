class Student < ApplicationRecord
  belongs_to :group, counter_cache: true
  belongs_to :school
end
