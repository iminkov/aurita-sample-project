
require('aurita/plugin')
Aurita.import_plugin_controller :advert, :banner

module Aurita
module Plugins
module Advert

  # Usage: 
  #
  #  Aurita::Main::plugin_get(Hook.right_column)
  #
  class Plugin < Aurita::Plugin::Manifest

    register_hook(:controller => Banner_Controller, 
                  :method     => :selection_box, 
                  :hook       => Hook.publish.page.tools) { Aurita.user.may(:edit_banners) }

  end

end
end
end


