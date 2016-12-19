defmodule Example.Github.Commit do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :sha, :string
    field :url, :string
  end

  def changeset(struct, data) do
    struct |> cast(data, [:sha, :url])
  end
end
