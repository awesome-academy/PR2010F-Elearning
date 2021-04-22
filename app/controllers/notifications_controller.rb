class NotificationsController < ApplicationController
  def new
    @notification = Notification.new
  end
  def show
    @notification = Notification.find_by id: params[:id]
    @tests = @notification.student.tests.created_before.order_by_date.paginate(page: params[:page]).per_page(5)
  end
  def update
    @notification = Notification.find_by id: params[:id]
    @notification.update(read_at: params[:read_at])
    respond_to do |format|
      redirect_to @notification
      format.js
    end
  end
  def create
    @notification = Notification.new notification_params
    if @notification.save
      counter = @notiunread.count
      flash[:success] = "Create success."
      redirect_to new_notification_path
      NotificationBroadcastJob.perform_later(@notification,counter)
    end
  end
  private
  def notification_params
    params.require(:notification).permit(:event,:student_id)
  end
end
