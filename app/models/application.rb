class Application
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String
  field :type, type: String
  field :_id, type: String, default: ->{ name }

  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :machines, :inverse_of => :applications, :foreign_key => :application_ids

  index({ _id: 1 }, { unique: true, name: "_id_index" })
  index({ name: 1 }, { unique: true, name: "name_index" })
end