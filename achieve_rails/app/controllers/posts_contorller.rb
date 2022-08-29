class PostsController < ApplicationController
  before_action :authenticated_user!, only: [:create]

  def create
    current_user.posts.create(params[:post]) 
  end
end