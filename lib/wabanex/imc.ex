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
    end

    defp handle_file({:error, _reason}) do
        {:error, "Error while reading the file"}
    end

    defp parse_line(line) do
        line
        |> String.split("\r")
        |> List.update_at(1, &String.to_float/1)
        |> List.update_at(2, &String.to_float/1)
    end
end
