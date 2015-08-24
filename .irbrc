#!/env/bin ruby

require 'irb/completion'
require 'irb/ext/save-history'
require 'pp'
require 'rubygems'
require 'wirble'

IRB.conf[:SAVE_HISTORY] = 100000
IRB.conf[:HISTORY_FILE] = File.expand_path('~/.irb_history')

Wirble.init
Wirble.colorize

if defined? Rails::Console
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  ActiveResource::Base.logger = Logger.new(STDOUT)

  if defined? Hirb
    Hirb.enable
  end
end
