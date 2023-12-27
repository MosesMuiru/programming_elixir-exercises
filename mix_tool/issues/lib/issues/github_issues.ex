defmodule Issues.GithubIssues do
  @moduledoc """

  """

  require Logger

  @github_url Application.get_env(:issues, :github_url)
  @user_agent [{"User-agent", "Elixir dave@pragprog.com"}]

  def fetch(username, project_name) do
    Logger.info("Fetching #{username}  project --> #{project_name}")
    issues_url(username, project_name)
    |> HTTPoison.get(@user_agent)
    |> handle_response
  end

  def issues_url(username, project_name) do
    "#{@github_url}/repos/#{username}/#{project_name}/issues"
  end

  def handle_response({:ok, %{status_code: status_code, body: body}}) do
    Logger.info("Got response: status code=#{status_code}")
    Logger.debug(fn -> inspect(body) end)
    {
      status_code |> check_for_error(),
      body |> Poison.Parser.parse!()
    }
  end

  def check_for_error(200), do: :ok
  def check_for_error(_), do: :error
end
