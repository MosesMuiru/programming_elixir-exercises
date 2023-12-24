defmodule CliTest do
  use ExUnit.Case

  doctest Issues

  import Issues.Cli, only: [parse_args: 1]

  test ":help return by option parsing -h and --help" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help

  end
  test "count is default to two values given" do
    assert parse_args(["user", "project"]) == {"user", "project", 4}
  end
end
