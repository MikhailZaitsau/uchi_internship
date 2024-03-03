class GroupsController < ApplicationController

  def index
    groups_list = Group.includes(:students).where(students: { school_id: params[:id] })
    if groups_list.empty?
      render status: :no_content
    else
      render json: groups_list, status: :ok
    end
  end
end
