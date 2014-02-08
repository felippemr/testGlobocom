class Application
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String
  field :type, type: String
  field :_id, type: String, default: ->{ name }

  validates_presence_of :name
  validates_uniqueness_of :name
end