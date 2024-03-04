module Students
  class Create
    def call(params)
      @params = params
      student
    end

    private

    def student
      @student ||=  Student.new(@params).save
    end
  end
end
