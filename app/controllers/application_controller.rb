class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :password_confirmation, :avatar])
  end

  private
  def logged_in_user
   unless student_signed_in?
     flash[:danger] = "Please log in."
     redirect_to new_student_session_path
   end
 end

 def after_sign_in_path_for(student)
   if current_student.admin == true
     admin_index_path
   else
     root_path
   end
 end
end
