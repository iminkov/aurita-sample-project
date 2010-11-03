
require('aurita/plugin')

module Aurita
module Plugins
module Flickr_Bridge


  # Usage: 
  #
  #  Aurita::Main::plugin_get(Hook.right_column)
  #
  class Plugin < Aurita::Plugin::Manifest

    register_hook(:controller => Flickr_Feed_Collection_Entry_Controller, 
                  :method     => :feed_collection_type, 
                  :hook       => Hook.plugins.feed.feed_collection_types)
                  
    register_hook(:controller => Cron_Controller, 
                  :method     => :hourly, 
                  :hook       => Hook.cron.hourly)
  end

end
end
end


