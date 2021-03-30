class User < ApplicationRecord
  has_many :own_events, class_name: 'Event', foreign_key: 'user_id', inverse_of: 'host'
  has_many :other_events, class_name: 'Eventlog', foreign_key: 'attendee_id', inverse_of: 'attendee'
  has_many :attending_events, -> { where('eventlogs.invite_accept = ?', true) }, through: :other_events,  source: :event
  has_many :invited_events, -> { where('eventlogs.invite_accept = ?', false) }, through: :other_events,  source: :event
  has_many :events, -> { where('eventlogs.invite_accept != ? ', :id) }, through: :other_events,  source: :event

  validates :name, uniqueness: true


end

# Version 1
# class User < ApplicationRecord
#   has_many :own_events, class_name: 'Eventlog', foreign_key: 'host_id'
#   has_many :events, through: :own_events
#   has_many :other_events, class_name: 'Eventlog', foreign_key: 'attendee_id'
#   has_many :events, through: :other_events
# 
# end
