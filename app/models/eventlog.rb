class Eventlog < ApplicationRecord
  belongs_to :attendee, class_name: 'User', foreign_key: "attendee_id"
  belongs_to :event
end

# Version 1
# class Eventlog < ApplicationRecord
#   belongs_to :host, class_name: 'User', foreign_key: "host_id"
#   belongs_to :attendee, class_name: 'User', foreign_key: "attendee_id"
#   belongs_to :event
# end