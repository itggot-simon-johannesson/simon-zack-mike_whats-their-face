defmodule Pluggy.Person do

    defstruct id: nil, firstname: "", lastname: "", photo: ""
    @db_datatypes %{"id" => "integer", "firstname" => "string", "lastname" => "string", "photo" => "string"}

    #GET
    def get() do
        Postgrex.query!(DB, "SELECT * FROM public.user", [], [pool: DBConnection.Poolboy]).rows
        |> response
    end

    def get(params) do
        case @db_datatypes["#{params["column"]}"] == "integer" do
        true -> 
            Postgrex.query!(DB, "SELECT * FROM person WHERE #{params["column"]} = $1", [String.to_integer(params["value"])], [pool: DBConnection.Poolboy]).rows
        false -> 
            Postgrex.query!(DB, "SELECT * FROM person WHERE #{params["column"]} = $1", [params["value"]], [pool: DBConnection.Poolboy]).rows
        end
       |> response
    end
    #GET END

    #CREATE
    def create(params) do
        Postgrex.query!(DB, "INSERT INTO person (firstname, lastname, photo) VALUES ($1, $2, $3)", [params["firstname"], params["lastname"], params["photo"]], [pool: DBConnection.Poolboy])
    end
    #CREATE END

    #DELETE
    def delete(params) do
        case @db_datatypes["#{params["column"]}"] == "integer" do
        true -> 
            Postgrex.query!(DB, "DELETE FROM person WHERE #{params["column"]} = $1", [String.to_integer(params["value"])], [pool: DBConnection.Poolboy])
        false -> 
            Postgrex.query!(DB, "DELETE FROM person WHERE #{params["column"]} = $1", [params["value"]], [pool: DBConnection.Poolboy])
        end
    end
    #DELETE END

    defp response(rows) do
        Enum.reduce(rows, [], fn([id, firstname, lastname, photo], acc) -> [ %Pluggy.Person{id: id, firstname: firstname, lastname: lastname, photo: photo} | acc] end )
    end


end