require 'rest-client'

module CsmdSms
  class Query
    
    def self.execute args, web_service
      new(args, web_service).execute
    end

    def initialize args
    end

    def execute
    end

    def md5_password
    end
  end
end