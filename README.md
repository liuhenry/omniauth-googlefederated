# OmniAuth Google Federated (Hybrid OpenID+OAuth) #

Hybrid authentication and authorization strategy for Google APIs. Combines the process for obtaining an authorized OAuth request token along with an OpenID authentication request. Based on the work of [Boy van Amstel](http://blog.boyvanamstel.nl/2011/07/omniauth-strategy-for-google-openidoauth-hybrid-protocol-login/). Unfortunately, OmniAuth 1.0 introduced significant [infrastructure changes](https://github.com/intridea/omniauth/wiki/Upgrading-to-1.0), so some modifications and updates were needed.

From the [Google API Docs](http://code.google.com/apis/accounts/docs/OpenID.html):

> The goal of OAuth is to acquire an access token from Google, which can then be used to exchange user-specific data with a Google service (such as calendar information or an address book). The regular OAuth process is a four-step sequence: (1) ask for a "request" token, (2) ask for the token to be authorized, which triggers user approval, (3) exchange the authorized request token for an "access" token, and (4) use the access token to interact with the user's Google service data. For a more detailed description, see OAuth for Web Applications.
> With OpenID+OAuth, this sequence remains essentially the same. The difference is that getting an authorized OAuth request token (steps 1 and 2) is wrapped up in the OpenID authentication request. In this way, the user can approve login and service access at the same time.

## Installation ##
Add to `Gemfile`:

```ruby
gem 'omniauth-googlefederated'
```

In Ruby 1.9.2, there is a bug in the interpreter that causes a segfault when using 'zip' on enumerables of bytes. As of January 30, 2012, this hasn't been fixed yet, so you need to use a fork of ruby-openid instead:

```ruby
gem 'ruby-openid', :git => 'git://github.com/liuhenry/ruby-openid.git'
```
Then run `bundle install`.

## Usage ##

For Devise, you need to configure `app/config/initializers/devise.rb`.

```ruby
config.omniauth :GoogleFederated, 
                :store => OpenID::Store::Filesystem.new('/tmp'), 
                :name => 'GoogleFederated', 
                :identifier => 'https://www.google.com/accounts/o8/id', 
                :consumer_key => GMAIL_KEY, 
                :consumer_secret => GMAIL_SECRET, 
                :scope => ["http(s)://www.google.com/calendar/feeds/", "https://www.google.com/m8/feeds/"], 
                :require => 'omniauth-googlefederated', 
                :client_options => {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}
```

The returned information is accessible in the omniauth.auth hash: 

```ruby
data = request.env["omniauth.auth"].info # OpenID login information
oauth = request.env["omniauth.auth"].credentials # OAuth credentials
```
