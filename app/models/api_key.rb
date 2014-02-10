class ApiKey
  include Mongoid::Document
  include Mongoid::Timestamps

  field :access_token, type: String

  before_create :generate_access_token

  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while !(self.class.exists(access_token: access_token))
  end
end
