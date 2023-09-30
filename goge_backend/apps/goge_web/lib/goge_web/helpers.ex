defmodule GoGe.Web.Helpers do
  @moduledoc false

  def convert_date(date_string), do: NaiveDateTime.from_iso8601!(date_string <> " 00:00:00")

  def convert_datetime(datetime_string), do: NaiveDateTime.from_iso8601!(datetime_string)
end
