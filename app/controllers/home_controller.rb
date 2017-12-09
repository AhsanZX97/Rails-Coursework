class HomeController < ApplicationController
  def home
  end

  def contact

  end

  def request_contact
		name = params[:name]
		email = params[:email]
		telephone = params[:telephone]
		message = params[:message]
		if email.blank?
			flash[:notice] = "no email detected, not send"
		else
		# Send an email
			ContactMailer.contact_email(email, name, telephone, message).deliver_now
			flash[:notice] = "email sent"
		end
		redirect_to root_path
	end
end
