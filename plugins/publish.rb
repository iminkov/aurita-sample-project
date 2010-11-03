
require('aurita/plugin')

Aurita.import_plugin_model :publish, :layout
Aurita.import_plugin_controller :publish, :layout
Aurita.import_plugin_controller :publish, :public_comment

module Aurita
module Plugins
module Publish

  # Usage: 
  #
  #  Aurita::Main::plugin_get(Hook.right_column)
  #
  class Plugin < Aurita::Plugin::Manifest

=begin
    register_hook(:controller => Layout_Controller, 
                  :method     => :article_partial, 
                  :hook       => Hook.wiki.article.hierarchy.partial) { |params|
      params[:part].is_a?(Layout)
    }
    register_hook(:controller => Layout_Controller, 
                  :method     => :article_partial_type, 
                  :hook       => Hook.wiki.article.hierarchy.partial_type) 
=end

    register_hook(:controller => Public_Comment_Controller, 
                  :method     => :unvalidated_comments_box, 
                  :hook       => Hook.publish.website_updates) { Aurita.user.is_registered? }

    register_hook(:controller => Public_Comment_Controller, 
                  :method     => :website_updates, 
                  :hook       => Hook.main.workspace.top) { Aurita.user.is_registered? }

    # Renders media container partial with buttons for 
    # horizontal/vertical positioning
    register_hook(:controller => Media_Container_Controller, 
                  :method     => :article_partial, 
                  :hook       => Hook.wiki.article.hierarchy.partial) { |params|
      params[:part].is_a?(Aurita::Plugins::Wiki::Media_Container)
    }

    register_hook(:controller => Page_Controller, 
                  :method     => :hierarchy_entry_type, 
                  :hook       => Hook.main.hierarchy_entry.entry_types)

    register_hook(:controller => Page_Controller, 
                  :method     => :perform_add_hierarchy_entry, 
                  :hook       => Hook.main.hierarchy_entry.add_entry) { |params|
      params[:entry_type] == 'PAGE'
    }
    register_hook(:controller => Page_Controller, 
                  :method     => :background_selection_box, 
                  :hook       => Hook.publish.page.tools) 

    register_hook(:controller => Page_Controller, 
                  :method     => :text_asset_link_field, 
                  :hook       => Hook.wiki.text_asset.link_editor)

# Structure 

    register_hook(:controller => Client_Site_Controller,
                  :method     => :list_hierarchies,
                  :hook       => Hook.main.left.site_hierarchies)

# Admin -> edit user: Set client site

    register_hook(:controller => Client_User_Controller,
                  :method     => :update_form_field,
                  :hook       => Hook.admin.edit_user)

    register_hook(:controller => Client_Site_Controller,
                  :method     => :admin_toolbar_buttons,
                  :hook       => Hook.admin.toolbar_buttons)


  end

end
end
end

