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

  def add_voucher
  end

  def generate_vouchers
    @qty = params[:qty].to_i
    @type = params[:voucher_type].to_s
    @value = params[:voucher_value].to_s

    @qty.times do |i|
      numA = Random.rand(9000) + 1000
      numB =  Random.rand(9000) + 1000
      code = numA.to_s + "-" + numB.to_s
      voucher = Voucher.create :voucher_code => code, :voucher_type => @type, :voucher_value => @value, :voucher_value_remaining => @value, :user_id => 1
      voucher.save!
    end
     redirect_to "/dashboard/vouchers"
  end

  def purchase_data
  end

  def data_purchase_transaction
    @selected = params[:selected]
    @user = params[:user_id]
    @arr = @selected.split(",")
    @type = "data"
    @value = @arr[0]
    @cost = @arr[1]

    if @account = Voucher.where(user_id: @user, voucher_type: 'airtime').having("voucher_value_remaining > ?", @cost).take
        @balance = @account.voucher_value_remaining.to_f - @cost.to_f
        @account.update(voucher_value_remaining: @balance)

        numA = Random.rand(9000) + 1000
        numB =  Random.rand(9000) + 1000
        code = numA.to_s + "-" + numB.to_s

        voucher = Voucher.create :voucher_code => code, :voucher_type => @type, :voucher_value => @value, :voucher_value_remaining => @value, :user_id => @user
        voucher.save!

        redirect_to root_path,  notice: "purchase successfull"
      else
        redirect_to root_path , notice: "insufficient funds"
  end

  end

  def purchase_voice
  end

  def voice_purchase_transaction
    @selected = params[:selected]
    @user = params[:user_id]
    @arr = @selected.split(",")
    @type = "voice"
    @value = @arr[0]
    @cost = @arr[1]

    if @account = Voucher.where(user_id: @user, voucher_type: 'airtime').having("voucher_value_remaining > ?", @cost).take
        @balance = @account.voucher_value_remaining.to_f - @cost.to_f
        @account.update(voucher_value_remaining: @balance)

        numA = Random.rand(9000) + 1000
        numB =  Random.rand(9000) + 1000
        code = numA.to_s + "-" + numB.to_s

        voucher = Voucher.create :voucher_code => code, :voucher_type => @type, :voucher_value => @value, :voucher_value_remaining => @value, :user_id => @user
        voucher.save!

        redirect_to root_path,  notice: "purchase successfull"
      else
        redirect_to root_path , notice: "insufficient funds"
  end

  end

  def transfer_airtime
  end

  def airtime_transaction
    @reciever_email = params[:reciever]
    @sender = params[:user_id]
    @amount = params[:amount]
    @ref = params[:ref]

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

  # Never trust parameters from the scary internet, only allow the white list through.
  def voucher_params
    params.require(:voucher).permit(:voucher_code, :voucher_type, :voucher_value, :voucher_value_remaining, :user_id )
  end

end
