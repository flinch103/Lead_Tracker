class Webinar < ApplicationRecord
  extend SpreadSheet

  def send_certificate(params)
    spreadsheet = open_created_spreadsheet(params[:webinar][:file])
    (1..spreadsheet.last_row).each do |index|
      attendence = spreadsheet.row(index)[0]
      first_name = spreadsheet.row(index)[1]
      last_name = spreadsheet.row(index)[2]
      email = spreadsheet.row(index)[3]
      next if attendence.downcase == "no" || email.nil?
      ac = ActionController::Base.new()  
      html_string = ac.render_to_string :template => 'certificate_pdf/pdf_view.pdf.erb', :locals =>{:name => "#{first_name} #{last_name}", :topic => self.name, :date => self.date, :speaker => self.speaker}
      
      pdf = WickedPdf.new.pdf_from_string(html_string)
      save_path = Rails.root.join("tmp", "#{first_name} #{last_name}_#{self.name}_Certificate.pdf")
      
      File.open(save_path, "wb") do |file|
        file << pdf
      end
      CertificateMailer.with(send_to: email, name: "#{first_name} #{last_name}", webinar: self.name, date: self.date, hashtag: self.hashtag).send_email.deliver_now
    end
  end

  def open_created_spreadsheet(file)
      case File.extname(file)
        when ".csv" then Roo::CSV.new(file.path)
        when ".xls" then Roo::Excel.new(file.path)
        when ".xlsx" then Roo::Excelx.new(file.path)
        else raise "Unknown File Type: #{file.original_filename}"
      end
    end
end
