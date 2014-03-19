# CsmdSms

[漫道](http://www.zucp.net/)的短信发送gem

## Installation

Add this line to your application's Gemfile:

    gem 'csmd_sms'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install csmd_sms

## Usage

```ruby
require 'csmd_sms'

CsmdSms.sn = "XXX-XXX-XXX-XXXXX"
CsmdSms.password = "*******"
CsmdSms.sign = "签名"
CsmdSms.send(mobile: '134XXXXX347', content: '短信验证码')
```

###OR

```ruby
require 'csmd_sms'

arg = { 
  sn: "XXX-XXX-XXX-XXXXX", 
  password: "*******", 
  sign: "签名", 
  mobile: ['134XXXXX347', '159XXXXX235'], 
  content: '短信验证码' 
}
CsmdSms.send arg
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
