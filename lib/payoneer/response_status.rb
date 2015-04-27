module Payoneer
  class ResponseStatus
    attr_reader :code, :description

    OK_STATUS_CODE = '000'

    def self.from_response(resp)
      code = resp.key?('Code') ? resp['Code'] : resp['Status'] # the key for the status code can be either for different API calls ...
      new(code, resp['Description'])
    end

    def initialize(code, description)
      @code = code
      @description = description
    end

    def ok?
      code == OK_STATUS_CODE
    end

    def ==(other)
      code == other.code && description == other.description
    end
  end
end