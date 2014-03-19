require "csmd_sms/version"
require 'csmd_sms/send'
require 'csmd_sms/query'

module CsmdSms
  WEB_SERVICE = 'http://sdk.entinfo.cn:8060/webservice.asmx/mt'

  def self.send args, web_service = WEB_SERVICE
    Send.execute args, web_service
  end

  def self.query args, web_service = WEB_SERVICE
    Query.execute args, web_service
  end

  def self.sn=(new_sn)
    @@sn = new_sn
  end

  def self.sn
    @@sn ||= nil
  end

  def self.password=(new_password)
    @@password = new_password
  end

  def self.password
    @@password ||= nil
  end

  def self.sign=(new_sign)
    @@sign = new_sign
  end

  def self.sign
    @@sign ||= nil
  end  
end
