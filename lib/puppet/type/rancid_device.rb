Puppet::Type.newtype(:rancid_device) do
  @doc = ''

  ensurable do
    defaultvalues
  end

  newparam(:name) do
    desc ''
  end

  newparam(:group) do
    desc ''
    isnamevar
  end

  newparam(:device) do
    desc ''
    isnamevar
  end

  def self.title_patterns
    identity = lambda { |x| x }
    [
      [
        /^(\S+)\/(\S+)$/,
        [
          [ :group, identity ],
          [ :device, identity ],
        ]
      ],
      [
        /(.*)/,
        [
          [ :name, identity ],
        ]
      ]
    ]
  end

  newproperty(:type) do
    desc ''
    munge do |value|
      value.to_s
    end
  end

  newproperty(:state) do
    desc ''
    munge do |value|
      value.to_s
    end
  end

  newproperty(:comment) do
    desc ''
    munge do |value|
      value.to_s
    end
  end

  newparam(:target) do
    desc ''
  end

  autorequire(:file) do
    self[:target]
  end
end
