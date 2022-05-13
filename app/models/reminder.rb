class Reminder < ApplicationRecord
    enum status: [:active, :archived, :expired]
    belongs_to :reminder_type
    validates :status, presence: true
    validates :title, length: { minimum: 2 }, presence: true
    validates :content, length: { minimum: 5 }, presence: true
    validates :expire_at, presence: true
    validates :reminder_type_id, presence: true
end
