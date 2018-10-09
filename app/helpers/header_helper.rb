# frozen_string_literal: true

# :nodoc:
module HeaderHelper
  def show_header
    return if (controller_name == 'home') && (action_name == 'index')

    render 'layouts/header'
  end
end
