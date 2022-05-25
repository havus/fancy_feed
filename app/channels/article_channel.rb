# frozen_string_literal: true

class ArticleChannel < ApplicationCable::Channel
  rescue_from StandardError, with: :report_error

  # Called when the consumer has successfully
  # become a subscriber to this channel.
  def subscribed
    stream_from 'all_articles'
    # can NOT called from `rails c` ActionCable.server.broadcast('all_articles', 'lorem ipsum')
  end

  private

  def report_error(_e)
    # broadcast_to(...)
  end
end
