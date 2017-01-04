require "heroku_dyno_restarter/version"
require "platform-api"

module HerokuDynoRestarter
  def self.restart_dynos(application_name, dyno_name = nil)
    return "Application name is required" if application_name.empty?

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
