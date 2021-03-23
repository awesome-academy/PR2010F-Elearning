class CoursesController < ApplicationController
  before_action :find_course, only: [:show]
  def index
   @courses = Course.paginate(page: params[:page]).per_page(4)
  end
  def show
   @course =  Course.find_by id: params[:id]
   @questions = @course.questions
  end
  def find_course
  @course =  Course.find_by id: params[:id]
  unless @course.present?
    flash[:success] = "Course doesn't exist"
    redirect_to courses_url
  end
end
end
