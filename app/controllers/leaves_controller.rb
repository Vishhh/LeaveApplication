class LeavesController < ApplicationController
  def index
    @leaves = current_user.leaves
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  def show
  end
end
