class Machine
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :location, type: String

  validates_presence_of   :name, :location

  has_and_belongs_to_many :applications, inverse_of: nil , index: true

  index({ _id: 1 }, { unique: true, name: "_id_index" })
end