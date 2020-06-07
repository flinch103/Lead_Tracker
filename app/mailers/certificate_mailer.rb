class CertificateMailer < ApplicationMailer
  
  def send_email
    save_path = Rails.root.join("tmp", "#{params[:name]}_#{params[:webinar]}_Certificate.pdf")
    attachments["#{params[:name]}.pdf"] = File.read(save_path)
    @ask = params[:hashtag]
    mail(to: params[:send_to], from: "info@moderninstitutes.in",subject: "#{params[:webinar]} dated #{params[:date]}.")
  end
end
