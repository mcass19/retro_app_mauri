# frozen_string_literal: true

# :nodoc:
module HeaderHelper
  def show_header
    unless (controller_name == 'home') && (action_name == 'index') 
      render 'layouts/header'
    end
  end
end
