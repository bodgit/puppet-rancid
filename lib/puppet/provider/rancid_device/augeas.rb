Puppet::Type.type(:rancid_device).provide(:augeas, :parent => Puppet::Type.type(:augeasprovider).provider(:default)) do
  desc ''

  default_file { '/etc/rancid/*/router.db' }

  lens { 'Rancid.lns' }

  confine :feature => :augeas

  resource_path do |resource|
    group = resource[:group]
    device = resource[:device]
    "$target/*[label() = '#{group}']/router.db/record[device = '#{device}']"
  end

  def self.instances
    augopen do |aug|
      resources = []
      aug.match("$target/*/router.db/*[label()!='#comment']").each do |spath|
        group = path_label(aug, "#{spath}/../..")
        device = aug.get(spath)
        entry = {
          :name    => "#{group}/#{device}",
          :ensure  => :present,
          :group   => group,
          :device  => device,
          :type    => aug.get("#{spath}/type"),
          :state   => aug.get("#{spath}/state"),
          :comment => aug.get("#{spath}/comment"),
        }
        resources << new(entry)
      end
      resources
    end
  end
end