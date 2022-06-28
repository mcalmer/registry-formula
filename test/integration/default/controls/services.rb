# frozen_string_literal: true

# Prepare platform "family"
platform_family = system.platform[:family]

control 'registry.service.running' do
  title 'The service should be installed, enabled and running'

  # Override by `platform_family`
  service_name =
    case platform_family
    when 'redhat'
      'docker-distribution'
    when 'debian'
      'docker-registry'
    else # suse
      'registry'
    end

  describe service(service_name) do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end
end
