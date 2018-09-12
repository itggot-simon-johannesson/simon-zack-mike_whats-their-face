defmodule Pluggy.List do

    alias Pluggy.Person

    def create(params) do        
        Postgrex.query!(DB, "INSERT INTO list (name, user_id, shared) VALUES ($1, $2, $3)", [params["name"], String.to_integer(params["user_id"]), String.to_existing_atom(params["shared"])], [pool: DBConnection.Poolboy])
    end

end


