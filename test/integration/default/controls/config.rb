# frozen_string_literal: true

platform_family = system.platform[:family]

control 'registry.config.file' do
  title 'Verify the configuration file'

  # Override by `platform_finger`
  configfile =
    case platform_family
    when 'suse'
      '/etc/registry/config.yml'
    when 'redhat'
      '/etc/docker-distribution/registry/config.yml'
    when 'debian'
      '/etc/docker/registry/config.yml'
    else
      '/etc/docker-distribution/config.yml'
    end

  describe file(configfile) do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    its('mode') { should cmp '0644' }
    # its('content_as_yaml') { should include('storage' => { 'filesystem' => {
    #     'rootdirectory' => '/var/lib/docker-registry' } } ) }
    # its('content_as_yaml') { should include('http' => { 'addr' => ':5000' } ) }
    its('content') { should match(%r{\s+rootdirectory:\s/var/lib/docker-registry}) }
    its('content') { should match(/\s+addr:\s:5000/) }
    its('content') { should_not match(/\s*auth:/) }
  end
end
