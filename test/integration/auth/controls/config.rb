# frozen_string_literal: true

platform_family = system.platform[:family]

control 'registry.config.file' do
  title 'Verify the configuration file'

  # Override by `platform_finger`
  configfile =
    case platform_family
    when 'suse'
      '/etc/registry/config.yml'
    when 'redhat', 'fedora'
      '/etc/docker-distribution/registry/config.yml'
    when 'debian'
      '/etc/docker/registry/config.yml'
    else
      '/etc/docker-distribution/config.yml'
    end

  htpasswdfile =
    case platform_family
    when 'suse'
      '/etc/registry/htpasswd'
    when 'redhat', 'fedora'
      '/etc/docker-distribution/registry/htpasswd'
    when 'debian'
      '/etc/docker/registry/htpasswd'
    else
      '/etc/docker-distribution/htpasswd'
    end

  reguser =
    case platform_family
    when 'redhat', 'fedora'
      'root'
    when 'debian'
      'docker-registry'
    else
      'registry'
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
    its('content') { should match(/\s*auth:/) }
    its('content') { should match(%r{\s+path:\s/.+/htpasswd}) }
    its('content') { should match(%r{\s+certificate: /etc/pki/tls/certs/registry.crt}) }
    its('content') { should match(%r{\s+key: /etc/pki/tls/private/registry.key}) }
  end

  describe file(htpasswdfile) do
    it { should be_file }
    it { should be_owned_by reguser }
    it { should be_grouped_into 'root' }
    its('mode') { should cmp '0600' }
    its('content') { should match(/^tux:.+/) }
  end

  describe file('/etc/pki/tls/certs/registry.crt') do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    its('mode') { should cmp '0644' }
    its('content') { should match(/^-----BEGIN CERTIFICATE-----$/) }
    its('content') { should match(/^-----END CERTIFICATE-----$/) }
  end

  describe file('/etc/pki/tls/private/registry.key') do
    it { should be_file }
    it { should be_owned_by reguser }
    it { should be_grouped_into 'root' }
    its('mode') { should cmp '0600' }
    its('content') { should match(/^-----BEGIN RSA PRIVATE KEY-----$/) }
    its('content') { should match(/^-----END RSA PRIVATE KEY-----$/) }
  end
end
