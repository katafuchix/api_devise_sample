# frozen_string_literal: true
module Logic
  module AdminUser
    def higher_admin?
      admin? || special?
    end
  end
end
