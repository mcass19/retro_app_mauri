# frozen_string_literal: true

# :nodoc:
class RetrospectivesController < ApplicationController
  def index; end

  def new
    @to_mention = []
    @to_discuss = []
    set_session_params(@to_mention, @to_discuss)
  end

  def create
    session_params
    @to_mention << params[:topic_to_mention] if
                                    params[:topic_to_mention].present?
    @to_discuss << params[:topic_to_discuss] if
                                    params[:topic_to_discuss].present?
  end

  private

  def set_session_params(to_mention, to_discuss)
    session[:array_to_mention] = to_mention
    session[:array_to_discuss] = to_discuss
  end

  def session_params
    @to_mention = session[:array_to_mention]
    @to_discuss = session[:array_to_discuss]
  end
end
