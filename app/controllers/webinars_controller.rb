class WebinarsController < ApplicationController

  def create
    @webinar = Webinar.new(webinar_params)
    if @webinar.save
      @webinar.send_certificate(params)
    end
    redirect_to send_certificate_certificates_path
  end

  private

  def webinar_params
    params.require(:webinar).permit(:name, :date, :speaker, :hashtag)
  end
end
