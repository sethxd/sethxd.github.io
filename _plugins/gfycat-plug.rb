# Title: Gfycat JS tags for Jekyll
# Author: Harry Denholm, ishani.org
# Description: plug the custom gfycat image tags into a page
#
# Syntax {% gfycat gfy_name %}
#
# Example:
# {% gfycat LateLikelyDassierat %}
#
# Output:
# <img class="gfyitem" data-id="LateLikelyDassierat" />
#

module Jekyll

  class GfyCatTag < Liquid::Tag
    @video = nil
    @videoname = ''


    def initialize(tag_name, markup, tokens)
      @videoname = markup.strip
      super
    end

    def render(context)
      output = super
      video = "<img class='gfyitem' data-controls='false' data-id='#{@videoname}'>"
    end

  end

  class GfyCatJS < Liquid::Tag
    def render(context)
      '<script src="https://assets.gfycat.com/gfycat.js"></script>'
    end
  end

end

Liquid::Template.register_tag('gfycat',     Jekyll::GfyCatTag)
Liquid::Template.register_tag('gfycat_js',  Jekyll::GfyCatJS)
