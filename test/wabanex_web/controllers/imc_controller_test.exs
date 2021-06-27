defmodule WabanexWeb.IMCControllerTest do
    use WabanexWeb.ConnCase, async: true

    describe "index/2" do
        test "When all params are valid, returns the imc info", %{conn: conn} do
            params = %{"filename" => "students.csv"}
            response = conn
            |> get(Routes.imc_path(conn, :index, params))
            |> json_response(:ok)

            expected_response =
                %{"result" =>
                    %{
                        "Dani" => 29.296874999999993,
                        "Diego" => 23.04002019946976,
                        "Gabul" => 22.857142857142858,
                        "Rafael" => 24.897060231734173,
                        "Rodrigo" => 26.234567901234566
                    }
                }
            assert expected_response == response
        end

        test "When tehre are invalid params, returns an error", %{conn: conn} do
            params = %{"filename" => "wrong_file_name.csv"}
            response = conn
            |> get(Routes.imc_path(conn, :index, params))
            |> json_response(:bad_request)

            expected_response = %{"result" => "Error while reading the file"}

            assert expected_response == response
        end
    end
end
