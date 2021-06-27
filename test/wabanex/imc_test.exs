defmodule Wabanex.IMCTest do
    use ExUnit.Case, async: true
    alias Wabanex.IMC

    describe "calculate/1" do
        test "When the file exists, returns the data" do
            params = %{"filename" => "students.csv"}

            response = IMC.calculate(params)

            expected_response =
            { :ok,
                %{"Dani" => 29.296874999999993,
                    "Diego" => 23.04002019946976,
                    "Gabul" => 22.857142857142858,
                    "Rafael" => 24.897060231734173,
                    "Rodrigo" => 26.234567901234566
                }
            }

            assert expected_response == response
        end

        test "When the wrong filename is given, returns an error" do
            params = %{"filename" => "wrong_file_name.csv"}

            response = IMC.calculate(params)

            expected_response =  {:error, "Error while reading the file"}

            assert expected_response == response
        end
    end
end
