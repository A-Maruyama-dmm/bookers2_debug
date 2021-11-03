class RelationshipsController < ApplicationController

  # ——————フォロー機能を作成・保存・削除する————————————
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end


end
