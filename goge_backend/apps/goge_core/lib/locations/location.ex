defmodule GoGe.Core.Location do
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
        name: "თბილისი/Tbilisi"
      },
      %__MODULE__{
        id: 2,
        name: "ბათუმი/Batumi"
      },
      %__MODULE__{
        id: 3,
        name: "რუსთავი/Rustavi"
      },
      %__MODULE__{
        id: 4,
        name: "ქუთაისი/Kutaisi"
      },
      %__MODULE__{
        id: 5,
        name: "ფოთი/Poti"
      },
      %__MODULE__{
        id: 6,
        name: "თელავი/Telavi"
      },
      %__MODULE__{
        id: 7,
        name: "ბაკურიანი/Bakuriani"
      },
      %__MODULE__{
        id: 8,
        name: "გუდაური/Gudauri"
      }
    ]
  end
end
