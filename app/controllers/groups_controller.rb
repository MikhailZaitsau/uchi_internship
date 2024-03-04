class GroupsController < ApplicationController

  def index
    @school_id = params[:id]
    if fetch_groups.empty?
      render status: :no_content
    else
      render json: fetch_groups, status: :ok
    end
  end

  private

  def fetch_groups
    Groups::Fetch.new.call(@school_id)
  end
end
