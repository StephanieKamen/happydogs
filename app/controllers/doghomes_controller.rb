class DoghomesController < ApplicationController

  def index
    @doghomes = Doghome.all
  end

  def show
    @doghome = Doghome.find(params[:id])
  end
end
