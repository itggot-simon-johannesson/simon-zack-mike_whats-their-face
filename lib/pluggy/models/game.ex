defmodule Pluggy.Game do
	
	defstruct(id: nil, firstname: "", lastname: "", photo: "")

	alias Pluggy.Game

	# def all do
	# 	Postgrex.query!(DB, "SELECT * FROM fruits", [], [pool: DBConnection.Poolboy]).rows
	# 	|> to_struct_list
	# end

	# def get_one(name) do
	# 	Postgrex.query!(DB, "SELECT * FROM public.person WHERE public.person.id IN (SELECT public.person_list.person_id FROM public.person_list WHERE public.person_list.list_id IN (SELECT public.list.id FROM public.list WHERE public.list.name = $1))", [name], [pool: DBConnection.Poolboy]).rows
	# 	|> to_struct_list
	# 	|> Enum.random
	# end

	def get(name) do
		Postgrex.query!(DB, "SELECT * FROM public.person WHERE public.person.id IN (SELECT public.person_list.person_id FROM public.person_list WHERE public.person_list.list_id IN (SELECT public.list.id FROM public.list WHERE public.list.name = $1))", [name], [pool: DBConnection.Poolboy]).rows
		|> to_struct_list
	end

	# defp add_points() do
		
	# end

	# def check_answer(params) do
	# 	session_all_names = conn.private.plug_session["user_id"]
	# 	all_names = case session_all_names do
	# 		nil -> nil
	# 		_ 	-> session_all_names
	# 	end
	# 	cond do
	# 		params["name_id"] == params["guess"] -> 
	# 			all_names
	# 	end		
	# end

	# def update(id, params) do
	# 	name = params["name"]
	# 	tastiness = String.to_integer(params["tastiness"])
	# 	id = String.to_integer(id)
	# 	Postgrex.query!(DB, "UPDATE fruits SET name = $1, tastiness = $2 WHERE id = $3", [name, tastiness, id], [pool: DBConnection.Poolboy])
	# end

	# def create(params) do
	# 	name = params["name"]
	# 	tastiness = String.to_integer(params["tastiness"])
	# 	Postgrex.query!(DB, "INSERT INTO fruits (name, tastiness) VALUES ($1, $2)", [name, tastiness], [pool: DBConnection.Poolboy])	
	# end

	# def delete(id) do
	# 	Postgrex.query!(DB, "DELETE FROM fruits WHERE id = $1", [String.to_integer(id)], [pool: DBConnection.Poolboy])	
	# end

	def to_struct([[id, firstname, lastname, photo]]) do
		%Game{id: id, firstname: firstname, lastname: lastname, photo: photo}
	end

	def to_struct_list(rows) do
		for [id, firstname, lastname, photo] <- rows, do: %Game{id: id, firstname: firstname, lastname: lastname, photo: photo}
	end
end