class ComentariosController < ApplicationController
  before_filter :autenticacao, :only => [:destroy]

  def create
    @post = Post.find(params[:post_id])
    @comentario = @post.comentarios.create(comentario_params)
    #@comentario = @post.comentarios.create(params[:comentarios])
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