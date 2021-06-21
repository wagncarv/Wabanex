defmodule Wabanex.IMC do

    def calculate(filename) do
        filename
        |> File.read()
        |> handle_file()
    end

    defp handle_file({:ok, content}) do
        content
        |> String.split("\n")
        |> Enum.map(fn elem -> parse_line(elem) end)
    end

    defp handle_file({:error, _reason}) do
        {:error, "Error while reading the file"}
    end

    defp parse_line(line) do
        line
        |> String.split(",")
    end
end
