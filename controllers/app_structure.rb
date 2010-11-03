
require('aurita')
require('aurita/controller')

Aurita::Main.import_controller :app_general
Aurita.import_plugin_controller :publish, :app_structure

module Aurita
module CDStex

  class App_Structure_Controller < Aurita::Plugins::Publish::App_Structure_Controller

    def left_old
      puts plugin_get(Hook.main.left.hierarchies, :perspective => 'STRUCTURE').map { |h| h.string } 
      exec_js("new accordion('app_left_column', { classNames: { content: 'accordion_box_body', toggle: 'accordion_box_header', toggleActive: 'accordion_box_header_active' } });");
    end

  end # class
  
end # module
end # module

