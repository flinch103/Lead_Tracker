class CertificatesController < ApplicationController

  def send_certificate
    session = GoogleDrive::Session.from_service_account_key("client_secret.json")
    spreadsheet = session.spreadsheet_by_title("Modern Group Certificate")
    worksheet = spreadsheet.worksheets.first
    
    worksheet.rows.each do |row| 
      puts row[0]
      pdf = WickedPdf.new.pdf_from_string("<h1>Hello #{row[0]}</h1><h1>This is your email #{row[1]}</h1>")
      save_path = Rails.root.join("#{row[0]}_Certificate.pdf")
      
      File.open(save_path, "wb") do |file|
        file << pdf
      end
      CertificateMailer.with(send_to: row[1], name: row[0]).send_email.deliver_now
    end
  end

end
