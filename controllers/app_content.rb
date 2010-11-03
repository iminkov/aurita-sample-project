
require('aurita')
require('aurita/controller')

Aurita::Main.import_controller :app_general

module Aurita
module CDStex

  class App_Content_Controller < Aurita::Main::App_General_Controller

    def left
      puts plugin_get(Hook.public.main.left.top).map { |component| component.string } 
      puts plugin_get(Hook.main.left.top).map { |component| component.string } 
      puts plugin_get(Hook.public.main.left).map { |component| component.string } 
      puts plugin_get(Hook.main.left).map { |component| component.string } 
    end

  end # class
  
end # module
end # module

