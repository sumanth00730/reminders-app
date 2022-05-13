class ReminderType < ApplicationRecord
    has_many :reminder
    validates :name, length: { minimum: 2 }, presence: true
end
