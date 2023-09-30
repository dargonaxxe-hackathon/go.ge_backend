defmodule GoGe.Web.UserController do
  @moduledoc false
  use GoGe.Web, :controller

  def create(conn, params) do
    with user_id <- params["user_id"],
         name <- params["name"],
         phone <- params["phone"],
         result <- GoGe.Core.create_user(user_id, name, phone) do
      render(conn, :create)
    end
  end
end
