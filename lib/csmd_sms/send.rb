require 'rest-client'
require 'digest'

module CsmdSms
  class Send
    attr_reader :sn, :password, :mobile, :content, :ext, :stime, :rrid, :md5_password, :sign,
                :response, :web_service, :error_code, :paramters, :sent_at, :responsed_at

    def self.execute args, web_service
      new(args, web_service).execute
    end

    def initialize args, web_service
      @web_service = web_service
      @sn = args[:sn] || CsmdSms.sn
      @sn or raise ArgumentError, 'pass sn or "CsmdSms.sn = YOUR_SN_STRING"'
      @password = args[:password] || CsmdSms.password
      @password or raise ArgumentError, 'pass password or "CsmdSms.password = YOUR_PASSWORD_STRING"'
      @mobile = args[:mobile] or raise ArgumentError, 'must pass mobile'
      @mobile.join(',') if @mobile.is_a?(Array)
      @content = args[:content] or raise ArgumentError, 'must pass content'
      @ext = args[:ext]
      @stime = args[:stime]
      @rrid = args[:rrid]
      @sign = args[:sign] || CsmdSms.sign
      @sign or raise ArgumentError, 'must pass sign or "CsmdSms.sign = YOUR_SIGN_STRING"'
      @md5_password = Digest::MD5.hexdigest("#{@sn}#{@password}").upcase
      @sent_at = Time.now
      @args = args
    end

    def execute
      begin
        Timeout::timeout(60) do
          @response = RestClient.post web_service, gen_paramters
          @responsed_at = Time.now
        end
        @error_code = 0
      rescue TimeoutError => e
        @error_code = 2
      rescue Exception => e
        @error_code = 5
      ensure
      end
      self
    end

    def gen_paramters
      @paramters = {
        "Sn"        => @sn,
        "Pwd"       => @md5_password,
        "Mobile"    => @mobile,
        "Content"   => "#{@content}[#{@sign}]".encode('gb2312'),
        "Ext"       => @ext,
        "Stime"     => @stime,
        "Rrid"      => @rrid
      }
    end
  end
end