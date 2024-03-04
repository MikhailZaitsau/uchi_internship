module Students
  class Destroy
    def call(id)
      @id = id
      destroy
    end

    private

    def destroy
      Student.find(@id).destroy
      true
    rescue ActiveRecord::RecordNotFound then false
    end
  end
end
