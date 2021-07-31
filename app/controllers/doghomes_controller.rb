class DoghomesController < ApplicationController

  def index
    @doghomes = Doghome.all
  end
end
