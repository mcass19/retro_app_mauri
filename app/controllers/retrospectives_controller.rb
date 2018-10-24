# frozen_string_literal: true

# :nodoc:
class RetrospectivesController < ApplicationController
  def index; end

  def new
    @to_mention = []
    @to_discuss = []
    set_session_params(@to_mention, @to_discuss)
  end

  def post_mention_topics
    return if params[:topic_to_mention].blank?

    mention_params
    incoming_mention = params[:topic_to_mention]
    @to_mention << incoming_mention
    @new_mention = incoming_mention
  end

  def post_discuss_topics
    return if params[:topic_to_discuss].blank?

    discuss_params
    incoming_discuss = params[:topic_to_discuss]
    @to_discuss << incoming_discuss
    @new_discuss = incoming_discuss
  end

  private

  def set_session_params(to_mention, to_discuss)
    session[:array_to_mention] = to_mention
    session[:array_to_discuss] = to_discuss
  end

  def mention_params
    @to_mention = session[:array_to_mention]
    @new_mention = nil
  end

  def discuss_params
    @to_discuss = session[:array_to_discuss]
    @new_discuss = nil
  end
end
