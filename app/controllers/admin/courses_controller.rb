class Admin::CoursesController < ApplicationController
  before_action  :find_course, only: %i[show edit update destroy]

  def index
    @categories = Category.all
    if params[:course].present?
      Course.reindex
      @courses = Course.search params[:course]
    else
      @courses = Course.all
    end
  end

  def show
  end

  def new
    @category = Category.all
    @course = Course.new
  end

  def create
    @course = Course.new(course_param)
    if @course.save
      flash[:success]= "Course created success"
      redirect_to admin_course_path(@course)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @course.update(course_param)
      flash[:success]= "Course updated success"
      redirect_to admin_course_path(@course)
    else
      render :edit
   end
  end

  def destroy
    @course.destroy
    redirect_to admin_courses_path
  end

  private

  def find_course
    @course = Course.find_by id: params[:id]
    unless @course.present?
      flash[:success] = "Course doesn't exist"
      redirect_to admin_courses_path
    end
  end

  def course_param
    params.require(:course).permit(:title, :description,:category_id,:img_course,
       questions_attributes: [:id, :title, :img_question,:_destroy, answers_attributes: [:id,:correct,:content,:_destroy]])
  end
end
