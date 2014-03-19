require "csmd_sms/version"
require 'csmd_sms/send'
require 'csmd_sms/query'

module CsmdSms
  @sn = nil
  @password = nil
  @sign = nil
  @host = 'http://sdk.entinfo.cn:8060/webservice.asmx/mt'

  class << self
    attr_accessor :sn, :password, :sign, :host
  end

  def self.send args
    Send.execute args
  end

  def self.query args
    Query.execute args
  end
end
