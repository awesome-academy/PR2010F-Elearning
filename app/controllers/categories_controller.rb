class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
      if @category.save
        flash[:success] = "Category was successfully created."
        redirect_to @category
      else
        render :new
      end
    end

  def update
      if @category.update(category_params)
        flash[:success] = "Category was successfully updated."
      else
      render :edit
      end
    end

  def destroy
      Category.find(params[:id]).destroy
      flash[:success] = "Category Deleted"
      redirect_to  categories_path
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:category)
    end
  end
