
require('aurita/plugin_controller')
Aurita.import_plugin_controller :wiki, :article

module Aurita
module Plugins
module Wiki

  class Article_Controller < Plugin_Controller

    def form_groups
      [
       Article.title,
       Article.header, 
       Content.tags, 
       Category.category_id, 
       Content.allow_public_comments
      ]
    end

  end

end
end
end

