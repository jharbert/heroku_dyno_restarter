require "heroku_dyno_restarter/version"
require "platform-api"

module HerokuDynoRestarter
  def self.restart_dynos(application_name, dyno_name = nil)
    raise ArgumentError.new("Application name is required") if application_name.empty?
    raise StandardError.new("HEROKU_OAUTH_TOKEN is nil, please set before running") if ENV['HEROKU_OAUTH_TOKEN'].nil?

    if dyno_name.nil?
      platform_api.dyno.restart_all(application_name)
    else
      platform_api.dyno.restart(application_name, dyno_name)
    end
  end
 
  private

  def self.platform_api
    @platform_api ||= PlatformAPI.connect_oauth(ENV['HEROKU_OAUTH_TOKEN'])
  end

end
