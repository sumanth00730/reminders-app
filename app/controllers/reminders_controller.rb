class RemindersController < ApplicationController
  before_action :set_reminder_type, only: [:edit, :destroy, :update]

  def index
    @reminder =Reminder.all
  end

  def new
    @reminder = Reminder.new
  end

  def edit
  end

  def update
  end

  def show
    @reminder = Reminder.find(params[:id])
  end

  def destroy
    @reminder = Reminder.find(params[:id])
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
            @reminder = ReminderType.find(params[:id])
        end
        def reminders_params
            params.require(:reminder).permit(:title,:content,:expire_at,:status,:reminder_type_id)
        end
end
