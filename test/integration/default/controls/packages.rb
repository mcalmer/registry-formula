# frozen_string_literal: true

# Prepare platform "family"
platform_family = system.platform[:family]
platform_codename = system.platform[:codename]

control 'registry.package.install' do
  title 'The required package should be installed'

  # Override by `platform_finger`
  package_name =
    case platform_family
    when 'redhat', 'fedora'
      'docker-distribution'
    when 'debian'
      'docker-registry'
    when 'suse'
      if platform_codename.include?('Tumbleweed')
        'distribution-registry'
      else
        'docker-distribution-registry'
      end
    else # default
      'docker-distribution-registry'
    end

  describe package(package_name) do
    it { should be_installed }
  end
end
