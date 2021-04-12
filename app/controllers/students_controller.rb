class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
    @tests = @student.tests.paginate(page: params[:page]).per_page(5)
  end
end
