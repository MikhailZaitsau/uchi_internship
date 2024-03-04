module Students
  class Fetch
    def call(params)
      @params = params
      prepare_studentst_list_json(students_list)
    end

    private

    def students_list
      @students_list ||= Student.where(school_id: @params[:school_id], group_id: @params[:group_id])
    end

    def prepare_studentst_list_json(students_list)
      students_list.map { |student| prepare_student_json(student) }
    end

    def prepare_student_json(student)
      {
        id: student.id,
        first_name: student.first_name,
        last_name: student.last_name,
        surname: student.surname,
        class_id: student.group_id,
        school_id: student.school_id
      }
    end
  end
end
