class CertificatesController < ApplicationController

  def new
    
  end

  def send_certificate
    # session = GoogleDrive::Session.from_service_account_key("client_secret.json")
    # spreadsheet = session.spreadsheet_by_title("Modern Group Certificate")
    # worksheet = spreadsheet.worksheets.first
    
    # #(0..2).each do |row|
    # worksheet.rows.each do |row|
    #   next if row[0].downcase == "no"
    #   ac = ActionController::Base.new()  
    #   html_string = ac.render_to_string :template => 'certificate_pdf/pdf_view.pdf.erb', :locals =>{:name => "#{row[1]} #{row[2]}", :topic => "Aatm Nirbhar Statups se hi Aatm Nirbhar Bharat ki Parikalpna", :date => "June 2, 2020", :speaker => "Dr. Unnat Pandit, Professor IP, Innovations & Enterprenurship at JNU Delhi, Former Program Director AIM, NITI AAYOG, Govt. of India"}
      
    #   pdf = WickedPdf.new.pdf_from_string(html_string)
    #   save_path = Rails.root.join("#{row[1]} #{row[2]}_Certificate.pdf")
      
    #   File.open(save_path, "wb") do |file|
    #     file << pdf
    #   end
    #   CertificateMailer.with(send_to: row[3], name: "#{row[1]} #{row[2]}").send_email.deliver_now
    # end
  end

end
