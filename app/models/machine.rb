class Machine
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :location, type: String

  has_and_belongs_to_many :applications, inverse_of: nil

  validates_presence_of   :name
  validates_uniqueness_of :name
  validates_presence_of   :location
end