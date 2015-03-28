require 'spec_helper'

module MediaHelper
  def is_public
    Media::permission[:public]
  end

  def is_private
    Media::permission[:private]
  end
end