module ControllerMacros
  def login_teacher
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:teacher]
      @teacher = create(:teacher)
      sign_in @teacher
    end
  end
end
