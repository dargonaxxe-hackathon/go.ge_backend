defmodule GoGe.Web.BookingController do
  @moduledoc false
  use GoGe.Web, :controller

  def incoming(conn, params) do
    with user_id <- params["user_id"],
         result <- GoGe.Core.get_incoming_bookings(user_id) do
      render(conn, :incoming, result: result)
    end
  end
end
