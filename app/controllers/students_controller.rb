# frozen_string_literal: true

require 'pry-byebug'
class StudentsController < ApplicationController
  before_action :authorize_student, only: [:destroy]

  def index
    if fetch_students.empty?
      render status: :no_content
    else
      render json: fetch_students, status: :ok
    end
  end

  def create
    student = create_student
    if student
      token = generate_auth_token(student[:id])
      response.set_header('X-Auth-Token', token)
      render json: student, status: :created
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

  def authorize_student
    render status: :unauthorized unless decode_token[0] == params[:id].to_i
  end

  def decode_token
    Students::TokenDecoder.new.call(request.headers['X-Auth-Token'])
  end

  def generate_auth_token(student_id)
    Students::TokenGenerator.new.call(student_id)
  end

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
    { school_id: params[:school_id], group_id: params[:class_id] }
  end

  def new_student_params
    params.permit(%i[first_name last_name surname class_id school_id])
  end
end
