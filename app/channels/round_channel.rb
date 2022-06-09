class RoundChannel < ApplicationCable::Channel
  def subscribed
    round = Round.find(params[:id])
    stream_for round
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
