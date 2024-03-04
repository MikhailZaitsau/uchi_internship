module Groups
  class Fetch
    def call(school_id)
      @school_id = school_id
      prepare_group_list_json(groups_list)
    end

    private

    def groups_list
      @groups_list ||= Group.includes(:students).where(students: { school_id: @school_id })
    end

    def prepare_group_list_json(groups_list)
      groups_list.map { |group| prepare_group_json(group) }
    end

    def prepare_group_json(group)
      {
        id: group.id,
        number: group.number,
        letter: group.letter,
        students_count: group.students_count
      }
    end
  end
end
