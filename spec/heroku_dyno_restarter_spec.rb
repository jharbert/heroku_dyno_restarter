require 'spec_helper'

describe HerokuDynoRestarter do
  it 'has a version number' do
    expect(HerokuDynoRestarter::VERSION).not_to be nil
  end

  it 'does not restart dynos without an application name' do
    expect{HerokuDynoRestarter.restart_dynos}.to raise_error(ArgumentError)
    expect{HerokuDynoRestarter.restart_dynos('')}.to raise_error(ArgumentError)
  end

  it 'does not restart dynos without a HEROKU_OAUTH_TOKEN environment variable' do
    expect{HerokuDynoRestarter.restart_dynos('nada')}.to raise_error(StandardError)
  end

  it 'does restart dynos' do
    ENV['HEROKU_OAUTH_TOKEN'] = 'something'

    # This for now until I stub out some examples
    expect{HerokuDynoRestarter.restart_dynos('nada')}.to raise_error(Excon::Error::Unauthorized)
  end
end
