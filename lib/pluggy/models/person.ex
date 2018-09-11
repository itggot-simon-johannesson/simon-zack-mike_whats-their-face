defmodule Pluggy.Person do

    @db_collumns = ["id", "firstname", "lastname", "photo"]
    
    #GET
    def get() do
        Postgrex.query!(DB, "SELECT * FROM person", [], [pool: DBConnection.Poolboy]).rows
        |> response
    end

    def get(params) do
        
        case @data_type_fruits["#{params["column"]}"] == "integer" do
        true -> 
            Postgrex.query!(DB, "SELECT * FROM person WHERE #{params["column"]} = $1", [String.to_integer(params["value"])], [pool: DBConnection.Poolboy]).rows
        false -> 
            Postgrex.query!(DB, "SELECT * FROM person WHERE #{params["column"]} = $1", [params["value"]], [pool: DBConnection.Poolboy]).rows
        end
        |> response
    end

    def get(params = %{"max_amount" => _}) do
        Postgrex.query!(DB, "SELECT * FROM person WHERE #{params["column"]} = $1 LIMIT #{max_amount}", [params["value"]], [pool: DBConnection.Poolboy]).rows
        |> response
    end
    #GET END

    #CREATE
    def create(params) do
        Postgrex.query!(DB, "INSERT INTO person (#{@db_collumns.}) VALUES ($1, $2)", [params["fruit"], String.to_integer(params["score"])], [pool: DBConnection.Poolboy])
    end
    #CREATE END

    #DELETE
    def delete(params) do
        case @data_type_fruits["#{params["column"]}"] == "integer" do
        true -> 
            Postgrex.query!(DB, "DELETE FROM fruits WHERE #{params["column"]} = $1", [String.to_integer(params["value"])], [pool: DBConnection.Poolboy])
        false -> 
            Postgrex.query!(DB, "DELETE FROM fruits WHERE #{params["column"]} = $1", [params["value"]], [pool: DBConnection.Poolboy])
        end
    end
    #DELETE END

    defp response(rows) do
        Enum.reduce(rows, [], fn([id, name, tastiness], acc) -> [ %Servy.Fruits{id: id, name: name, tastiness: tastiness} | acc] end )
    end


end