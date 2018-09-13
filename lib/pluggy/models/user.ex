defmodule Pluggy.User do

	defstruct(id: nil, username: "")


	require IEx
	alias Pluggy.User

	def get(id) do
		Postgrex.query!(DB, "SELECT id, username FROM public.user WHERE id = $1 LIMIT 1", [id],
        pool: DBConnection.Poolboy
      ).rows |> to_struct
	end

	def get_id(id) do
		Postgrex.query!(DB, "SELECT id, username FROM public.user WHERE id = $1 LIMIT 1", [String.to_integer(id)], [pool: DBConnection.Poolboy]).rows
		|> to_struct
	end

	def to_struct([[id, username]]) do
		%User{id: id, username: username}
	end
end