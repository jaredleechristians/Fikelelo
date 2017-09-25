class DashboardController < ApplicationController
  before_action :authenticate_user!

# Determine device by retrieveing HTTP headers
# Generate device token
# Retrieve device IP
  def dashboard
    @client = DeviceDetector.new(request.user_agent)
    @client_browser_name = @client.name
    @client_os_name = @client.os_name
    @client_device_name = @client.device_name
    @client_type = @client.device_type
    @client_ip = request.remote_ip
    @client_device_token = Devise.friendly_token

    @devices = current_user.devices

    @vouchers = Voucher.all

  end

  def link_voucher
    @voucher = Voucher.where(voucher_code: params[:voucher_code]).take

    if @voucher.voucher_type == 'data'
      @suffix = "MB"
    elsif @voucher.voucher_type == 'voice'
      @suffix = "MIN"
    elsif @voucher.voucher_type == 'airtime'
      @prefix = "ZAR "
    end
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

def voucher_param
   params.require(:voucher).permit(:id,:user_id)
end
