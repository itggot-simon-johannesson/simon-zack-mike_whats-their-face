defmodule Pluggy.GameController do
  
  require IEx

  alias Pluggy.Game
  # alias Pluggy.User
  import Pluggy.Template, only: [render: 2]
  import Plug.Conn, only: [send_resp: 3]


#   def index(conn) do

#     send_resp(conn, 200, render("games/game_one.html", []))

#     #get user if logged in
#     session_user = conn.private.plug_session["user_id"]
#     current_user = case session_user do
#       nil -> nil
#       _   -> User.get(session_user)
#     end

#     send_resp(conn, 200, render("fruits/index", fruits: Fruit.all(), user: current_user))
#   end

  def show_game_one(conn) do
    send_resp(conn, 200, render("games/game_one.html", names: Game.get("1A")))
  end

  def show_game_two(conn) do
    send_resp(conn, 200, render("games/game_two.html", names: Game.get("1A")))
  end

  def game_one(conn) do 
    send_resp(conn, 200, render("games/game_one.html", []))
  end

  def game_two(conn), do: send_resp(conn, 200, render("games/game_two.html", []))

  def game_three(conn), do: send_resp(conn, 200, render("games/game_three.html", []))

#   def new(conn),          do: send_resp(conn, 200, render("fruits/new", []))
#   def show(conn, id),     do: send_resp(conn, 200, render("fruits/show", fruit: Fruit.get(id)))
#   def edit(conn, id),     do: send_resp(conn, 200, render("fruits/edit", fruit: Fruit.get(id)))
  
#   def create(conn, params) do
#     Fruit.create(params)
#     #move uploaded file from tmp-folder (might want to first check that a file was uploaded)
#     File.rename(params["file"].path, "priv/static/uploads/#{params["file"].filename}")
#     redirect(conn, "/fruits")
#   end

#   def update(conn, id, params) do
#     Fruit.update(id, params)
#     redirect(conn, "/fruits")
#   end

#   def destroy(conn, id) do
#     Fruit.delete(id)
#     redirect(conn, "/fruits")
#   end

  #  defp redirect(conn, url) do
  #    Plug.Conn.put_resp_header(conn, "location", url) |> send_resp(303, "")
  #  end

end
