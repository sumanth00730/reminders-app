class ReminderTypesController < ApplicationController
    before_action :set_reminder_type, only: [:edit,:destroy]
    def index
        @reminder_types =ReminderType.all
    end
    def edit
    end
    def new
        @reminder_type = ReminderType.new
    end
    def show
        @reminder_type = ReminderType.find(params[:id])
    end
    def destroy
        @reminder_type = ReminderType.find(params[:id])

        if @reminder_type.destroy
            flash[:notice] = "Reminder type has been deleted successfully"
            redirect_to reminder_types_url
        else
            flash[:notice] = "Reminder type deletion failed"
        end
    end
    def create
        @reminder_type = ReminderType.new(reminder_type_params)

        if @reminder_type.save
            flash[:notice] = "Reminder type has been successfully added"
            redirect_to reminder_types_url
        else
            flash[:notice] = "Reminder type addition failed"
        end
    end

    private
        def set_reminder_type
            @reminder_type = ReminderType.find(params[:id])
        end
        def reminder_type_params
            params.require(:reminder_type).permit(:name)
        end
end
