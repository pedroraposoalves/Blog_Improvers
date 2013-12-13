class ComentariosController < ApplicationController
  before_filter :authorize_blogger!, :only => [:destroy]

  def create
    @post = Post.find(params[:post_id])
    @comentario = @post.comentarios.create(comentario_params)
    #@comentario = @post.comentarios.create(params[:comentarios])
    if @comentario.autor == nil
      @comentario.autor = current_user.name
      @comentario.save
    end
    redirect_to post_path(@post)

  end

  def comentario_params
    params.require(:comentario).permit(:autor,:conteudo,:post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comentario = @post.comentarios.find(params[:id])
    @comentario.destroy
    redirect_to post_path(@post)
  end
end