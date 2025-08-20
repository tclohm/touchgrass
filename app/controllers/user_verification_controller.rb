class UserVerificationController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = current_user
  end
  
  def update
    if current_user.update(user_params)
      redirect_to user_verification_path, notice: 'Profile updated!'
    else
      render :show
    end
  end
  
  def verify_phone
    # In a real app, you'd integrate with Twilio or similar
    # For now, just simulate verification
    if params[:verification_code] == "123456" # Demo code
      current_user.update(phone_verified: true)
      redirect_to user_verification_path, notice: 'Phone verified!'
    else
      redirect_to user_verification_path, alert: 'Invalid verification code'
    end
  end
  
  def upload_id
    if current_user.government_id.attach(params[:government_id])
      current_user.update(government_id_verified: false) # Needs manual review
      redirect_to user_verification_path, notice: 'ID uploaded! We\'ll review it within 24 hours.'
    else
      redirect_to user_verification_path, alert: 'Failed to upload ID'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:phone_number)
  end
end
