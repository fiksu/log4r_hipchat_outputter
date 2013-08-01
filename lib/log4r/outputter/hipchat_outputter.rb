require 'log4r/outputter/outputter'
require 'log4r/staticlogger'
require 'hipchat'

module Log4r
  class HipchatOutputter < Outputter
    attr_reader :api_token, :room, :color, :username, :notify, :message_format

    def initialize(_name, hash={})
      super(_name, hash)
      validate(hash)
    end

    private

    def validate(hash)
      @api_token = (hash[:api_token] or hash['api_token'])
      @room = (hash[:room] or hash['room'] or "alarms")
      @username = (hash[:username] or hash['username'] or "Log4r")
      @color = (hash[:color] or hash['color'] or "yellow") # red, purple, green, gray, random
      @notify = (hash[:notify] or hash['notify']) == "true"
      @message_format = (hash[:message_format] or hash['message_format'] or "text") # or "html"

      @hipchat_options = {
        :color => @color,
        :notify => @notify,
        :message_format => @message_format
      }
    end

    def canonical_log(event)
      synch {
        send_hipchat @formatter.format event
      }
    end

    def send_hipchat(msg)
      ### send email
      begin
        @client ||= HipChat::Client.new(@api_token)
        @client[@room].send(@username, msg, @hipchat_options)
      rescue Exception => e
        Logger.log_internal(-2) {
	  "HipchatOutputter '#{@name}' couldn't send hipchat!"
        }
        Logger.log_internal {e}
        self.level = OFF
        raise e
      end # begin
    end # def send_mail
  end # class HipchatOutputter
end # module Log4r
