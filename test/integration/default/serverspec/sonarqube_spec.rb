require "serverspec"

set :backend, :exec

describe service("sonar") do
  it { should be_enabled }
  it { should be_running }
end

describe command("i=0; while [ $i -lt 200 -a -z \"$(grep 'SonarQube is up' /opt/sonar/logs/sonar.log)\" ]; do i=$[$i+1] sleep 1s; done") do
  its(:exit_status) { should eq 0 }
end

describe port("9000") do
  it { should be_listening }
end

describe command('curl -L localhost:9000') do
  its(:stdout) { should contain('SonarQube') }
end
