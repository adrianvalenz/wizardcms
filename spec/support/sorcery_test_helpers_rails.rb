module Sorcery
  module TestHelpers
    module Rails
      def sign_in(user)
        visit login_path
        fill_in "Email", with: user.email
        fill_in "Password", with: "secret"
        click_on "sign-in-button"
      end
    end
  end
end
