require 'net/http'

class HttpService
  attr_accessor :uri

  def initialize(url)
    self.uri = URI.parse url
  end

  def perform_get
    Net::HTTP.get uri
  end
end
