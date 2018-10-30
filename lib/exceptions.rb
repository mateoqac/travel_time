module Exceptions

  class ThirdPartyAPIError < StandardError
    
    def message
      "Error trying to get the info from external API"
    end
  end
end