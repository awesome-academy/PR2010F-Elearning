class CoursesController < ApplicationController
  before_action :find_course, only: [:show,:update]
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
      flash.now[:notice] = 'No statuses to display' if @courses.empty?
    end
  end
  def show
    @test = Test.new
    @like = Like.new
    @questions = @course.questions
  end

  def update
    if params[:quantity].present?
      @course.update(quantity: params[:quantity])
      respond_to do |format|
        format.js
      end
    end
    if params[:timer].present?
      @course.update(timer: params[:timer])
      respond_to do |format|
        format.js
      end
    end
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
