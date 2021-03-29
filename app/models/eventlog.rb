class Eventlog < ApplicationRecord
  belongs_to :attendee, class_name: 'User', foreign_key: "attendee_id"
  belongs_to :event, foreign_key: 'event_id'

  scope :find_invited, ->(givenevent) { where("event_id = ?", givenevent)}
end

# Version 1
# class Eventlog < ApplicationRecord
#   belongs_to :host, class_name: 'User', foreign_key: "host_id"
#   belongs_to :attendee, class_name: 'User', foreign_key: "attendee_id"
#   belongs_to :event
# end