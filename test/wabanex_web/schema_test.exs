defmodule WabanexWeb.SchemaTest do
    use WabanexWeb.ConnCase, async: true
    alias Wabanex.User
    alias Wabanex.Users.Create

    describe "users queries" do
        test "When a valid id is given, returns the user", %{conn: conn} do
            params = %{email: "email@email.com", name: "Mcleaod" , password: "123456"}

            {:ok, %User{id: user_id}} = Create.call(params)

            query = """
                {
                    getUser(id: "#{user_id}"){
                        name
                        email
                    }
                }
            """

            response = conn
            |> post("/api/graphql", %{query: query})
            |> json_response(:ok)

            assert  %{
                        "data" =>
                        %{"getUser" =>
                            %{"email" => "email@email.com",
                            "name" => "Mcleaod"}}}
                     = response
        end
    end

    describe "users mutations" do
        test "When all params are valid, creates the user", %{conn: conn} do
            mutation = """
                mutation{
                    createUser(input: {
                    name: "Paulus",
                    email: "Paulus Maiores@mail.com",
                    password: "123456"
                    }){
                        id
                        name
                    }
                }
            """

            response = conn
            |> post("/api/graphql", %{query: mutation})
            |> json_response(:ok)

            assert  %{"data" =>
                        %{"createUser" =>
                            %{"id" => _id,
                            "name" => "Paulus"}}}
                    = response
        end
    end
end
