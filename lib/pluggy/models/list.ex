defmodule Pluggy.List do
    
    defstruct id: nil, name: "", user_id: nil, shared: false
    @db_datatypes %{"id" => "integer", "name" => "string", "user_id" => "integer", "shared" => "boolean"}

    def create(params) do        
        Postgrex.query!(DB, "INSERT INTO list (name, user_id, shared) VALUES ($1, $2, $3)", [params["name"], String.to_integer(params["user_id"]), String.to_existing_atom(params["shared"])], [pool: DBConnection.Poolboy])
    end

    def get(params) do
        case @db_datatypes["#{params["column"]}"] == "integer" do
        true -> 
            Postgrex.query!(DB, "SELECT * FROM list WHERE #{params["column"]} = $1", [String.to_integer(params["value"])], [pool: DBConnection.Poolboy]).rows
        false -> 
            Postgrex.query!(DB, "SELECT * FROM list WHERE #{params["column"]} = $1", [params["value"]], [pool: DBConnection.Poolboy]).rows
        end
       |> response
    end

    def delete(id) do
        Postgrex.query!(DB, "DELETE FROM list WHERE id = $1", [id], [pool: DBConnection.Poolboy])
    end

    defp response(rows) do
        Enum.reduce(rows, [], fn([id, name, user_id, shared], acc) -> [ %Pluggy.List{id: id, name: name, user_id: user_id, shared: shared} | acc] end )
    end

end


