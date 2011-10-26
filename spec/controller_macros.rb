module ControllerMacros
  def login
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in Factory.create(:jimmy)
  end
end
