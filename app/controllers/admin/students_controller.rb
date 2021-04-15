class Admin::StudentsController < ApplicationController
  before_action :find_student, only: %i[ show ]

  def index
      @students = Student.all
  end

  def show
  end

  private
    def find_student
      @student = Student.find(params[:id])
      unless @student.present?
        flash[:success] = "Student doesn't exist"
        redirect_to admin_students_path
      end
    end

    def admin_student_params
      params.riquire(:student).permit(:name, :address, :school_name)
    end
end
