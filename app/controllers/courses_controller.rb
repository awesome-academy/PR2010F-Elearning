class CoursesController < ApplicationController
  before_action :find_course, only: [:show]
  def index
    @categories = Category.all

    cate = params[:cate]
    if !cate.nil?
      @courses = Course.where(:category_id => cate)
    else
       @courses = Course.all
       # @courses = Course.paginate(page: params[:page]).per_page(4)
   end
 end
  def show
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
