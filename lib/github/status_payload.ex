defmodule Example.Github.StatusPayload do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :sha, :string
    field :description, :string
    field :state, :string
    embeds_one :commit, Example.Github.Commit
    embeds_many :branches, Example.Github.Branch
    embeds_one :repository, Example.Github.Repository
  end

  def from_json(data) when is_binary(data) do
    Poison.decode!(data) |> from_json
  end
  def from_json(data) when is_map(data) do
    %__MODULE__{}
    |> cast(data, [:sha, :description, :state])
    |> cast_embed(:commit)
    |> cast_embed(:branches)
    |> cast_embed(:repository)
    |> apply_changes
  end
end
