module TruncateHtml
  class Configuration
    attr_accessor :length, :omission, :word_boundary
  end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield configuration
  end

end
