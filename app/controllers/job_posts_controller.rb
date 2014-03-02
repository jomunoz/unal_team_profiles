# encoding: UTF-8
class JobPostsController < ApplicationController

  def index 
    @job_posts = JobPost.all
  end

  def new
    @job_post = JobPost.new
  end

  def create
    @job_post = JobPost.new(params[:job_post])
    begin
      if @job_post.save!
        flash[:notice] = "Se ha ingresado existosamente el anuncio: #{@job_post.source.html_safe}"
        redirect_to job_posts_path
      end
    rescue Exception => e
      flash[:error] = "Ocurrió un error al ingresar el anuncio: #{@job_post.source.html_safe}. #{e.message}"
      render 'new'
    end
  end 

end
