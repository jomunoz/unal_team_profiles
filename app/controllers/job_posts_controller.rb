# encoding: UTF-8
class JobPostsController < ApplicationController

  def index 
  end

  def new
    @job_post = JobPost.new
  end

  def create
    @job_post = JobPost.new(params[:job_post])
    debugger
    if @job_post.save
      flash[:notice] = "Se ha ingresado existosamente el anuncio: #{@job_post.source.html_safe}"
      redirect_to job_posts_path
    else
      flash[:error] = "Ocurrió un error al ingresar el anuncio: #{@job_post.source.html_safe}"
      render 'new'
    end 
  end 

end
