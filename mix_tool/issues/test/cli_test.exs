defmodule CliTest do
  use ExUnit.Case

  doctest Issues

  import Issues.Cli, only: [parse_args: 1, sort_into_desceding_order: 1]

  test ":help return by option parsing -h and --help" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "count is default to two values given" do
    assert parse_args(["user", "project"]) == {"user", "project", 4}
  end

  # create a fake data that contain the value created_at

  test "sort the isses in desceding order -- the correct way" do
    results = sort_into_desceding_order(fake_data(["c", "a", "b"]))
    issues = for issue <- results, do: Map.get(issue, "created_at")
    assert issues == ~w{c b a}
  end

  def fake_data(issues) do
    for value <- issues do
      %{"created_at" => value, "other_data" => "this is other data"}
    end
  end
end
