class RemindersController < ApplicationController
  before_action :set_reminder_type, only: [:edit, :destroy, :update]

  def index
    @reminder = Reminder.all
  end

  def new
    @reminder = Reminder.new
  end

  def edit
    @reminder = Reminder.find(params[:id])
    render :edit
  end

  def update
    @reminder = Reminder.find(params[:id])
        if @reminder.update(reminders_params)
            flash[:notice] = "Reminder has been updated successfully"
            redirect_to reminders_url
        else
            flash[:notice] = "Reminder updation failed"
        end
  end

  def show
    @reminder = Reminder.find(params[:id])
  end

  def destroy
    @reminder = Reminder.find(set_reminder_type)
        if @reminder.destroy
            flash[:notice] = "Reminder type has been deleted successfully"
            redirect_to reminders_url
        else
            flash[:notice] = "Reminder type deletion failed"
        end
  end
  def create
    @reminder = Reminder.new(reminders_params)

        if @reminder.save
            flash[:notice] = "Reminder type has been successfully added"
            redirect_to reminders_url
        else
            flash[:notice] = "Reminder type addition failed"
        end
  end
  private
        def set_reminder_type
            @reminder = Reminder.find(params[:id])
        end
        def reminders_params
            params.require(:reminder).permit(:title,:content,:expire_at,:status,:reminder_type_id)
        end
end
