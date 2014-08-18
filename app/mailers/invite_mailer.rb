class InviteMailer < ActionMailer::Base
  default from: "inmemoriamdbc@gmail.com"

  def invite_email(email, deceased_name)
  	mail(to: email,
         subject: "Mourn for the loss of #{deceased_name}") do |format|
      format.html { render 'invitation' }
      format.text { render 'invitation' }
    end
  end
end
