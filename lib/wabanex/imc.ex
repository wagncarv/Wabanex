defmodule Wabanex.IMC do

    def calculate(filename) do
        filename
        |> File.read()
        |> handle_file()
    end

    defp handle_file({:ok, content}) do
        content
        |> String.replace(~r/\r/, "")
        |> String.split("\n")
        |> Enum.map(fn elem -> parse_line(elem) end)
        |> Enum.into(%{})
    end

    defp handle_file({:error, _reason}) do
        {:error, "Error while reading the file"}
    end

    defp parse_line(line) do
        line
        |> String.replace(" ", "")
        |> String.split(",")
        |> List.update_at(1, &String.to_float/1)
        |> List.update_at(2, &String.to_float/1)
        |> calculate_imc()
    end

    defp calculate_imc([name, height, weight]), do: {name, weight/(height * height)}
end
