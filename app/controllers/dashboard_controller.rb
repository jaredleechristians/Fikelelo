class DashboardController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @client = DeviceDetector.new(request.user_agent)
    @vouchers = Voucher.all

    @client_browser_name = @client.name
    @client_os_name = @client.os_name
    @client_device_name = @client.device_name
    @client_type = @client.device_type
    @client_ip = request.remote_ip
    @client_device_token = Devise.friendly_token
    @devices = current_user.devices

  end

  def help
  end

  def terms
  end

  def profile
  end

  def devices
  end

  def transactions
  end
end
