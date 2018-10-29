# frozen_string_literal: true

# :nodoc:
class RetrospectivesController < ApplicationController
  def index; end

  def new
    @to_mention = []
    @to_discuss = []
    @action_plans = []
    set_session_params(@to_mention, @to_discuss, @action_plans)
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

  def add_action_plan
    return if params[:action_plan].blank?

    action_plans_params
    incoming_plan = params[:action_plan]
    @action_plans << incoming_plan
    @new_action_plan = incoming_plan
  end

  private

  def set_session_params(to_mention, to_discuss, action_plans)
    session[:array_to_mention] = to_mention
    session[:array_to_discuss] = to_discuss
    session[:array_action_plans] = action_plans
  end

  def mention_params
    @to_mention = session[:array_to_mention]
    @new_mention = nil
  end

  def discuss_params
    @to_discuss = session[:array_to_discuss]
    @new_discuss = nil
  end

  def action_plans_params
    @action_plans = session[:array_action_plans]
    @new_action_plan = nil
  end
end
