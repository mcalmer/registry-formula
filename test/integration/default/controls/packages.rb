# frozen_string_literal: true

# Prepare platform "family"
platform_family = system.platform[:family]

control 'registry.package.install' do
  title 'The required package should be installed'

  # Override by `platform_finger`
  package_name =
    case platform_family
    when 'redhat'
      'docker-distribution'
    when 'debian'
      'docker-registry'
    else # suse
      'docker-distribution-registry'
    end

  describe package(package_name) do
    it { should be_installed }
  end
end
