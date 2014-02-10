class Machine
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :location, type: String

  validates :name, :allow_blank => false, uniqueness: true, :presence => true
  validates :location, :allow_blank => false, :presence => true

  has_and_belongs_to_many :applications, inverse_of: nil , index: true

  index({ _id: 1 }, { unique: true, name: "_id_index" })
  index({ application_ids: 1 }, { background:true, name: "application_ids_index" })
end