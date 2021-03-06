require 'puppet/parameter/boolean'

Puppet::Type.newtype(:aptly_publish) do
  @doc = %q{Provides an overlay over the aptly publish command
  }

  ensurable

  newparam(:name, :namevar => true) do
    desc "The name of the Aptly snapshot. Example : weekly-update"
  end

  newparam(:force, :boolean => true, :parent => Puppet::Parameter::Boolean) do
    desc "Force the action. For example, it will force-drop when using aptly publish drop."
    defaultto :true
  end

  newparam(:source_type) do
    desc "Type of the source for the snapshot : repository or snapshot"
    newvalues(:repo, :snapshot)
    defaultto :snapshot
  end

end
