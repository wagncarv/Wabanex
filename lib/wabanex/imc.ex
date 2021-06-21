defmodule Wabanex.IMC do

    def calculate(filename) do
        filename
        |> File.read()
        |> handle_file()
    end

    defp handle_file({:ok, content}) do
        {:ok, content}
    end

    defp handle_file({:error, _reason}) do
        {:error, "Error while reading the file"}
    end
end
