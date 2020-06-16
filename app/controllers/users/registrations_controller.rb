# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  def new 
    @user = User.new
  end
  
  def create
    params[:user][:birthday] = birthday_join
    @user = User.new(sign_up_params)
    unless @user.valid?
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"] [:user] ["password"] = params[:user] [:password]
    @address = @user.build_user_address
    render :new_address
  end
  
  
  
  def create_address
    @user = User.new(session["devise.regist_data"] ["user"])
    @address = UserAddress.new(address_params)
    unless @address.valid?
      render :new_address and return
    end
    @user.build_user_address(@address.attributes)
    @user.save
    session["devise.regist_data"] ["user"].clear
    sign_in(:user, @user)
  end
  
  
    # before_action :configure_sign_up_params, only: [:create]
    # before_action :configure_account_update_params, only: [:update]
  
    # GET /resource/sign_up
    # def new
    #   super
    # end
  
    # POST /resource
    # def create
    #   super
    # end
  
    # GET /resource/edit
    # def edit
    #   super
    # end
  
    # PUT /resource
    # def update
    #   super
    # end
  
    # DELETE /resource
    # def destroy
    #   super
    # end
  
    # GET /resource/cancel
    # Forces the session data which is usually expired after sign
    # in to be expired now. This is useful if the user wants to
    # cancel oauth signing in/up in the middle of the process,
    # removing all OAuth session data.
    # def cancel
    #   super
    # end
  
    protected
  
    def address_params
      params.require(:user_address).permit(:postcode, :prefecture, :city, :address, :apartment, :telephone)
    end
  
    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_up_params
    #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
    # end
  
    # If you have extra params to permit, append them to the sanitizer.
    # def configure_account_update_params
    #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
    # end
  
    # The path used after sign up.
    # def after_sign_up_path_for(resource)
    #   super(resource)
    # end
  
    # The path used after sign up for inactive accounts.
    # def after_inactive_sign_up_path_for(resource)
    #   super(resource)
    # end
    private 
   
 
   def birthday_join
     date = params[:birthday]
 
     if date["birthday(1i)"].empty? && date["birthday(2i)"].empty? && date["birthday(3i)"].empty?
       return
     end
 
     Date.new date["birthday(1i)"].to_i,date["birthday(2i)"].to_i,date["birthday(3i)"].to_i
 
   end
    
    
  end
  
  
 
 
