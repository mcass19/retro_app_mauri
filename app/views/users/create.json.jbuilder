# frozen_string_literal: true

json.user @user.as_json(only: %i[id username email password profile_img])
