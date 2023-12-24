defmodule Issues.Cli do
  @default_count 4

  @moduledoc """

  """
  def run(argv) do
    argv
    |> parse_args()
    |> process
  end

  @doc """
  this one takes in argument from cli
  OptionParser.parse takes in the a
  the argument passed to it
  switch -- shows waht is passed like help: :boolean--thi should return
  """
  def parse_args(argv) do
     OptionParser.parse(argv, switches: [ help: :boolean], aliases: [h: :help])
    # this is takes first element

  |> elem(1)
  |> args_to_internal_representation()

#     case parse do
#       {[help: true ], _ , _ } -> :help
#       { _, [user, project, count], _} -> { user, project, String.to_integer(count)}
#       { _, [ user, project ], _ } -> { user, project, @default_count }
# _ -> :help
    # end
  end

  def process(:help) do
    IO.puts """
    usage: issues <user> <project> [ count @default_count]
    """

    System.halt(0)
  end

  def process({user, project, _count}) do
    Issues.GithubIssues.fetch(user, project)
  end
  def args_to_internal_representation([user, project, count]) do
    { user, project, String.to_integer(count)}
  end

  def args_to_internal_representation([user, project]) do
    { user, project, @default_count}
  end

  def args_to_internal_representation(_) do
    :help
  end
end
