require 'spec_helper'

describe HerokuDynoRestarter do
  it 'has a version number' do
    expect(HerokuDynoRestarter::VERSION).not_to be nil
  end

  it 'does not restart dynos without an application name' do
    expect{HerokuDynoRestarter.restart_dynos}.to raise_error(ArgumentError)
    expect(HerokuDynoRestarter.restart_dynos('')).to eq('Application name is required')
  end
end
