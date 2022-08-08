class Api::V1::MunchiesController < ApplicationController
  def index
    binding.pry
    render json: MunchiesSerializer.new()
  end
end