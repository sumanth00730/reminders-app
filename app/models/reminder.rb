class Reminder < ApplicationRecord
    enum status: [:active, :archived, :expired]
    belongs_to :reminder_type
end
