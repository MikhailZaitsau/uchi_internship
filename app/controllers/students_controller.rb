require 'pry-byebug'
class StudentsController < ApplicationController
  def index
    if fetch_students.empty?
      render status: :no_content
    else
      render json: fetch_students, status: :ok
    end
  end

  def create
    if create_student
      render json: create_student, status: :created
    else
      render status: :method_not_allowed
    end
  end

  def destroy
    if destroy_student
      render status: :ok
    else
      render status: :bad_request
    end
  end

  private

  def fetch_students
    Students::Fetch.new.call(fetch_students_params)
  end

  def create_student
    Students::Create.new.call(new_student_params)
  end

  def destroy_student
    Students::Destroy.new.call(params[:id])
  end

  def fetch_students_params
    { school_id: params[:school_id], group_id: params[:id] }
  end

  def new_student_params
    params.permit(%i[first_name last_name surname group_id school_id])
  end
end
