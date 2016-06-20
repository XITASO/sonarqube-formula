require "serverspec"

set :backend, :exec

describe service("sonar") do
  it { should be_enabled }
  it { should be_running }
end

describe port("9000") do
  it { should be_listening }
end

describe command('curl -L localhost:9000') do
  its(:stdout) { should contain('SonarQube') }
end
