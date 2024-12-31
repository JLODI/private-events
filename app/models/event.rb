class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :event_tickets, foreign_key: "attended_event_id", dependent: :destroy
    has_many :attendees, through: :event_tickets
    scope :past, -> { where("date < ?", Date.today)}
    scope :future, -> { where("date >= ?", Date.today)}
end
