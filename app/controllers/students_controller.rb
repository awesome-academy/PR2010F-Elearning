class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
    @tests = @student.tests
  end
end
