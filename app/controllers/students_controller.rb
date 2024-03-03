require 'pry-byebug'
class StudentsController < ApplicationController

  def index
    student_list = Student.where(school_id: params[:school_id], group_id: params[:id])
    if student_list.empty?
      render status: :no_content
    else
      render json: student_list, status: :ok
    end
  end

  def create
    @student = Student.new(new_student_params)
    if @student.save
      render json: @student, status: :created
    else
      render status: :method_not_allowed
    end
  end

  def destroy
    Student.find(params[:id]).destroy
    render status: :ok
  rescue ActiveRecord::RecordNotFound then render status: :bad_request
  end

  private

  def new_student_params
    params.permit(%i[first_name last_name surname id group_id school_id])
  end
end
