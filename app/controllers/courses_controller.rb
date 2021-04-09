class CoursesController < ApplicationController
  before_action :find_course, only: [:show]

  def index
     @categories = Category.all
     if params[:cate]
       category = Category.find_by id:  params[:cate]
         if category.present?
           @courses = category.courses.paginate(page: params[:page]).per_page(4)
         else
           flash[:success] = "Category doesn't exist"
           redirect_to categories_path
         end
     else
       @courses = Course.search(params[:search]).paginate(page: params[:page]).per_page(4)
     end
  end

  def show
   @test = Test.new
   @questions = @course.questions
  end

 private

  def find_course
    @course =  Course.find_by id: params[:id]
    unless @course.present?
      flash[:success] = "Course doesn't exist"
      redirect_to courses_path
    end
  end

end
