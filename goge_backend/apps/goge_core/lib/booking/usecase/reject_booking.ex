defmodule GoGe.Core.UseCase.RejectBooking do
  @moduledoc false

  @repo GoGe.Core.Repo

  def execute(booking_id) do
    booking = @repo.get(GoGe.Core.Booking, booking_id)
    params = %{status: :rejected}

    GoGe.Core.Booking.changeset(booking, params)
    |> @repo.update()
  end
end
