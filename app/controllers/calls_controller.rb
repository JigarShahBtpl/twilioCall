class CallsController < ApplicationController
  def new
    @call = Call.new
  end

  def create
    @client = Twilio::REST::Client.new(Call::TWILIO_SID, Call::AUTH_TOKEN)
    @call = Call.new(call_params)
    if @call.save
      call = @client.calls.create(
                                  twiml: '<Response><Say>Ahoy, World!</Say></Response>',
                                  to: '+91 '+params[:to_num],
                                  from: Call::CALL_NUM
                                  )
    end
  end

  private

  def call_params
    params.require(:call).permit(:name, :call_to, :to_num)
  end
end
