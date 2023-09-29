defmodule GoGeCore.Location do
  @moduledoc false

  use Ecto.Schema

  # todo localization
  schema "locations" do
    field(:name, :string)
  end

  def values() do
    [
      %__MODULE__{
        id: 1,
        name: "Tbilisi"
      },
      %__MODULE__{
        id: 2,
        name: "Batumi"
      },
      %__MODULE__{
        id: 3,
        name: "Ureqi"
      },
      %__MODULE__{
        id: 4,
        name: "Qutaisi"
      }
    ]
  end
end
