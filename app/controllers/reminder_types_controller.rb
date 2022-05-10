class ReminderTypesController < ApplicationController
    def index
        @reminder_types =ReminderType.all
    end
    def new
        @reminder_type = ReminderType.new
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
        def reminder_type_params
            params.require(:reminder_type).permit(:name)
        end
end
