module WeekOfMonth
  class Configuration
    attr_accessor \
      :monday_active

    def initialize
      @monday_active = false
    end

    def monday_active?
      @monday_active
    end
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configuration=(config)
    @configuration = config
  end

  def self.configure
    yield configuration
  end
end
