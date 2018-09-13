defmodule Pluggy.PersonList do
    
    defstruct id: nil, person_id: nil, list_id: nil

    def get(list_id) do
        Postgrex.query!(DB, "SELECT * FROM person_list WHERE list_id = $1", [list_id], [pool: DBConnection.Poolboy]).rows
        |> response
    end

    def delete(list_id) do
        Postgrex.query!(DB, "DELETE FROM person_list WHERE list_id = $1", [list_id], [pool: DBConnection.Poolboy])
    end

    def delete_person_id(person_id) do
        Postgrex.query!(DB, "DELETE FROM person_list WHERE person_id = $1", [person_id], [pool: DBConnection.Poolboy])
    end

    defp response(rows) do
        Enum.reduce(rows, [], fn([id, person_id, list_id], acc) -> [ %Pluggy.PersonList{id: id, person_id: person_id, list_id: list_id} | acc] end )
    end

end