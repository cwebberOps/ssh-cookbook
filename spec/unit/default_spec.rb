require 'spec_helper'

describe 'ssh::default' do
  let(:chef_run) do
    ChefSpec::Runner.new.converge(described_recipe)
  end

  it 'installs ssh' do
    expect(chef_run).to install_package('openssh-server')
  end

  it 'configures ssh' do
    expect(chef_run).to create_template('/etc/ssh/sshd_config').with(
      owner: 'root',
      group: 'root'
    )
  end

  it 'starts running sshd service' do
    expect(chef_run).to enable_service('sshd')
    expect(chef_run).to start_service('sshd')
  end

end
