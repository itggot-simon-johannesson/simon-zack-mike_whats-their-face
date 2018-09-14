defmodule Pluggy.ListController do
    
    alias Pluggy.Person
    alias Pluggy.PersonList

    import Pluggy.List
    import Plug.Conn, only: [send_resp: 3]

    def create(conn, params) do
        Pluggy.List.create(params)
        redirect(conn, "/user/#{params["user_id"]}")
    end

    def delete(conn, user_id ,list_id) do
        Enum.map(   PersonList.get(list_id),
                    fn person -> Postgrex.query!(DB, "DELETE FROM person WHERE id = $1", [person.person_id], [pool: DBConnection.Poolboy]) end)
        
        PersonList.delete(list_id)
        Pluggy.List.delete(list_id)

        redirect(conn, "/user/#{user_id}/list")
    end

    def remove_person(conn, params, user_id, list_id) do

        Postgrex.query!(DB, "DELETE FROM person WHERE id = $1", [params["id"]], [pool: DBConnection.Poolboy])
        PersonList.delete_person_id(params["id"])

        redirect(conn, "/user/#{user_id}/list/#{list_id}")
    end

    def add_person(conn, params, user_id, list_id) do

        Person.create(params)
        person = List.first(Person.get(%{"column" => "photo", "value" => "#{params["photo"]}"}))

        Postgrex.query!(DB, "INSERT INTO person_list (person_id, list_id) VALUES ($1, $2)", [person.id, list_id], [pool: DBConnection.Poolboy])

        redirect(conn, "/user/#{user_id}/list/#{list_id}")
    end

    defp redirect(conn, url), do: Plug.Conn.put_resp_header(conn, "location", url) |> send_resp(303, "")

end