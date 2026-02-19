class TopicsController < ApplicationController

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find_by(name: params[:name])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_parameters)
    @topic.user = current_user

    if @topic.save
      redirect_to topic_show_path(name: @topic.name)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def topic_parameters
    params.expect(topic: [ :name ])
  end
end