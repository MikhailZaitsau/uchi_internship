# frozen_string_literal: true

module Students
  class Create
    def call(params)
      params['group_id'] = params.delete('class_id')
      @params = params
      create_student
    end

    private

    def create_student
      student = Student.new(@params)
      student.save ? prepare_student_json(student) : false
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
