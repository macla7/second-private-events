class Event < ApplicationRecord
  has_many :eventlogs, foreign_key: 'event_id'
  has_many :attendees, -> { where('eventlogs.invite_accept = ?', true) }, through: :eventlogs, source: :attendee
  has_many :invitees, -> { where('eventlogs.invite_accept = ?', false) }, through: :eventlogs, source: :attendee
  belongs_to :host, class_name: 'User', foreign_key: 'user_id', inverse_of: 'own_events'

  scope :past, -> { where("time <= ?", Time.now)}
  scope :future, -> { where("time > ?", Time.now)}
end



# Version 1
# class Event < ApplicationRecord
#  has_many :eventlogs
#  has_many :attendees, through: :eventlogs, source: :attendee
#  has_one :main_party_user, class_name: 'Eventlog'
#  has_one :host, through: :main_party_user, class_name: 'User'
# end
