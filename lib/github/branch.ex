defmodule Example.Github.Branch  do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :name, :string, default: ""
    embeds_one :commit, Example.Github.Commit
  end

  def changeset(struct, data) do
    struct
    |> cast(data, [:name])
    |> cast_embed(:commit)
  end
end
