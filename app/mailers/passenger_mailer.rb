class PassengerMailer < ApplicationMailer

  def thank_you_email
    @booking = params[:booking]
    @url = 'just kidding'
    mail(to: @booking.passengers.first.name, subject: 'Booking confirmed and thank you!')
  end

end
