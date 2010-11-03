
require('aurita/plugin')
Aurita.import_plugin_controller :stats, :main

module Aurita
module Plugins
module Stats


  class Plugin < Aurita::Plugin::Manifest

    register_hook(:controller => Main_Controller, 
                  :method     => :daily_summary, 
                  :hook       => Hook.calendar.event.list_day) { 
      Aurita.user.is_registered? 
    }
    register_hook(:controller => Main_Controller, 
                  :method     => :weekly_summary, 
                  :hook       => Hook.calendar.event.list_week) { 
      Aurita.user.is_registered? 
    }
    register_hook(:controller => Main_Controller, 
                  :method     => :monthly_summary, 
                  :hook       => Hook.calendar.event.list_month) { 
      Aurita.user.is_registered? 
    }
                  
                  
                  
  end

end
end
end


