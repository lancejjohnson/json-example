defmodule Example.Github.Repository do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :id, :integer
    field :name, :string
    field :full_name, :string
    field :description, :string
  end

  def changeset(struct, data) do
    struct |> cast(data, [:id, :name, :full_name, :description])
  end
end
