module Groups
  class Fetch
    def call(school_id)
      @school_id = school_id
      groups_list
    end

    private

    def groups_list
      @groups_list ||= Group.includes(:students).where(students: { school_id: @school_id })
    end
  end
end
