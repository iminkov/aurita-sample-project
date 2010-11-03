
require('aurita')
require('aurita/controller')

Aurita::Main.import_controller :app_main

module Aurita
module CDStex

  class App_Main_Controller < Aurita::Main::App_Main_Controller

    def header_buttons

      return unless Aurita.user.is_registered? 

      buttons  = Array.new
      buttons << Context_Menu_Element.new(HTML.div(:class   => :header_button, 
                                                   :id      => :button_App_Structure, 
                                                   :onclick => Javascript.Aurita.GUI.switch_layout('App_Structure')) { tl(:structure) }, 
                                          :type   => :app_section,
                                          :params => { :category => 'STRUCTURE' } )
      buttons << HTML.div(:class   => :header_button, 
                          :id      => :button_App_Content, 
                          :onclick => Javascript.Aurita.GUI.switch_layout('App_Content')) { tl(:content) }

      if Aurita.user.is_admin? then
        buttons << HTML.div(:class   => :header_button, 
                            :id      => :button_App_Admin, 
                            :onclick => Javascript.Aurita.GUI.switch_layout('App_Admin')) { tl(:admin) }
      end
      buttons
    end


    def left
    end

    def start
    end

  end # class
  
end # module
end # module

