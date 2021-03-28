class Event < ApplicationRecord
  has_many :eventlogs
  has_many :attendees, through: :eventlogs, source: :attendee
  belongs_to :host, class_name: 'User', foreign_key: 'user_id', inverse_of: 'own_events'
end



#version 1
#class Event < ApplicationRecord
#  has_many :eventlogs
#  has_many :attendees, through: :eventlogs, source: :attendee
#  has_one :main_party_user, class_name: 'Eventlog'
#  has_one :host, through: :main_party_user, class_name: 'User'
#end
