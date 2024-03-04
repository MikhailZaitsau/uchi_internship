module Students
  class Fetch
    def call(params)
      @params = params
      students_list
    end

    private

    def students_list
      @students_list ||= Student.where(school_id: @params[:school_id], group_id: @params[:group_id])
    end
  end
end
