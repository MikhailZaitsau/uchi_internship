module Students
  class Create
    def call(params)
      @params = params
      create_student
    end

    private

    def create_student
      student = Student.new(@params)
      student.save ? student : false
    end
  end
end
