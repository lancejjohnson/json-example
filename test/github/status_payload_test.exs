defmodule Example.Github.StatusPayloadTest do
  use ExUnit.Case
  alias Example.Github.{StatusPayload, Commit, Repository, Branch}

  setup do
    json_file = "test/support/fixtures/status_event.json"
    binary = json_file |> File.read!
    data = binary |> Poison.decode!
    {:ok, data: data, binary: binary}
  end

  test "parsing to structs from map", ctx do
    payload = StatusPayload.from_json(ctx.data)

    assert_payload_parsed_to_structs(payload)
    assert_branches_parsed_nested_structs(payload.branches)
  end

  test "allows using Poison decoding directly", ctx do
    payload = Poison.decode!(
      ctx.binary,
      as: %StatusPayload{
        commit: %Commit{},
        repository: %Repository{},
        branches: [%Branch{commit: %Commit{}}]
      }
    )

    assert_payload_parsed_to_structs(payload)
    assert_branches_parsed_nested_structs(payload.branches)
  end

  def assert_payload_parsed_to_structs(payload) do
    assert %{
      commit: %Commit{},
      repository: %Repository{},
      branches: [_branch | _other]
    } = payload
  end

  def assert_branches_parsed_nested_structs(branches) do
    for branch <- branches do
      assert %Branch{commit: %Commit{}} = branch
    end
  end
end
