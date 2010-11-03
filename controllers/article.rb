
require('aurita')
Aurita.import_plugin_controller :wiki, :article

module Aurita
module Plugins
module Wiki

  class Article < Aurita::Main::Content
    html_escape_values_of :header
  end

  class Article_Controller < Plugin_Controller
    def form_groups
      [
       Article.title,
       Article.header,
       Content.tags, 
       Category.category_id
      ]
    end
  end

end
end
end

