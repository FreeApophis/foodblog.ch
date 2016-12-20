class SettingsController < ApplicationController
  before_action :get_setting, only: [:edit, :update]

  def index
    @settings = policy_scope(Setting)
  end

  def edit
  end

  def update
    if @setting.value != params[:setting][:value]
      @setting.value = params[:setting][:value]
      @setting.save
      redirect_to settings_path, notice: 'Setting has updated.'
    else
      redirect_to settings_path
    end
  end

  def get_setting
    @setting = Setting.find_by(var: params[:id]) || Setting.new(var: params[:id])
    authorize @setting
  end
end
