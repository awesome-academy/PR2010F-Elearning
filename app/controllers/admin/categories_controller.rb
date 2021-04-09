class Admin::CategoriesController < ApplicationController
  before_action :find_category, only: %i[ show edit update destroy ]

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
        flash[:success] = "Create successfully category"
        redirect_to admin_categories_path
      else
        render :new
        flash[:danger] = 'Error'
      end
    end

    def update
		if @category.update(category_params)
      flash[:success] = "Category updated"
      redirect_to admin_categories_path
		else
			render 'edit'
		end
	end


  def destroy
   @category.destroy
   flash[:success] = 'Category deleted'
   redirect_to admin_categories_path
 end

  private

  def find_category
    @category = Category.find(params[:id])
    unless @category.present?
      flash[:success] = "Category doesn't exist"
      redirect_to admin_categories_path
    end
  end

    def category_params
      params.require(:category).permit(:category,:img_category)
    end
end
