class RegisterDevice
  attr_reader :user, :device
  def initialize(user, device)
    @user = user
    @device = device
  end


  def call
    user.devices << device
    user.save
  end


  def errors?
    user.errors?
  end

end