class User < ApplicationRecord
  has_many :own_events, class_name: 'Event', foreign_key: 'user_id', inverse_of: 'host'
  has_many :other_events, class_name: 'Eventlog', foreign_key: 'attendee_id'
  has_many :events, through: :other_events
end

# Version 1
# class User < ApplicationRecord
#   has_many :own_events, class_name: 'Eventlog', foreign_key: 'host_id'
#   has_many :events, through: :own_events
#   has_many :other_events, class_name: 'Eventlog', foreign_key: 'attendee_id'
#   has_many :events, through: :other_events
# 
# end
