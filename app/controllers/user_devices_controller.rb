class UserDevicesController < ApplicationController
  before_action :set_device, :users_except_using, only: %i(new create)

  def index
    @user_devices = current_user.user_devices.recent
    @pagy, @user_devices = pagy @user_devices, items: 10
  end

  def new
    @user_device = @device.user_devices.build
  end

  def create
    @user_device = @device.user_devices.build user_device_params
    if @user_device.save
      respond_to do |format|
        format.html{redirect_to device_path(id: @device.id), notice: t(".success")}
        format.turbo_stream{
          @modal = true
          flash.now[:notice] = t(".success")
        }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_device_params
    params.require(:user_device).permit :status, :input_date, :output_date, :user_id, :device_id
  end

  def set_device
    @device = current_user.office.devices.find_by id: params[:device_id] || params[:user_device][:device_id]
  end

  def users_except_using
    users = current_user.office.users
    @users_except_using = users.left_joins(:user_devices)
  end
end
