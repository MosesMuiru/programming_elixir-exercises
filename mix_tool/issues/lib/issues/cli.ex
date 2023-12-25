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

  def process({user, project, count}) do
    Issues.GithubIssues.fetch(user, project)
    |> decode_response()
    |> sort_into_desceding_order()
    |> last(count)
    |> formatting()
  end

  def formatting(list_of_issues) do
    ~s{## | created_at | title}
    IO.puts("##_______ | created_at___________ | title_________")
    for issue <- list_of_issues do
      IO.puts(" #{issue["id"]}        #{issue["created_at"]}        #{issue["title"] } ")




    end
  end

  # sorting from desceding order that is recently created to the last created

  def last(list, count) do
    list
    |> Enum.take(count)
    |> Enum.reverse()
  end


  def sort_into_desceding_order(issues) do
    issues
    |> Enum.sort(fn first_issue, second_issues -> first_issue["created_at"] >= second_issues["created_at"] end)

  end

  # this is used to check the status of the return status
  #
  def decode_response({:ok, body}) , do: body
  def decode_response({:error, error})do
    IO.puts "error opening the issues --- the error ---> #{error}"
    System.halt(2)
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
