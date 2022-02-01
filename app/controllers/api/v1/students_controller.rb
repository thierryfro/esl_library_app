class Api::V1::StudentsController < ApplicationController

  before_action :load_student, only: [:show, :update, :destroy, :courses_enrolled]
  rescue_from ActiveRecord::RecordNotFound, with: :student_not_found

  def index
    # Should have some limits to respond (pagination, a limit of users to respond)
    # Can add an filter, search
    @students = User.where(role: 'student')
  end

  def show
  end

  def create
    student = User.new(student_params)
    student.role = 'student'

    if student.save
      render :show
    else
      render json: { message: "It was not possible to create the student", errors: student.errors.full_messages }, status: :bad_request
    end
  end

  def update
    if @student.update(student_params)
      render :show
    else
      render json: { message: "It was not possible to update the student", errors: @student.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    if @student.destroy
      render json: { message: "User destroyed" }, status: :ok
    else
      render json: { message: "It was not possible to delete the student", errors: @student.errors.full_messages }, status: :bad_request
    end
  end

  def courses_enrolled
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :country)
  end

  def load_student
    @student = User.find_by!(id: params[:id])
    # can use email to find, if email has a unique key validation
    # @student = User.find_by!(email: params[:email])
  end

  def student_not_found
    render json: { message: 'Was not possible find an student with the ID provided' }, status: 404
  end

end
