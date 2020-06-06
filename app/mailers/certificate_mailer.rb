class CertificateMailer < ApplicationMailer
  
  def send_email
    save_path = Rails.root.join("#{params[:name]}_Certificate.pdf")
    attachments["#{params[:name]}.pdf"] = File.read(save_path)
    mail(to: params[:send_to], from: "coolvaibhav1809@gmail.com",subject: "Mail subject")
  end
end
