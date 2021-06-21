defmodule Wabanex.IMC do

    def calculate(filename) do
        filename
        |> File.read()
        |> handle_file()
    end

    defp handle_file({:ok, content}), do: content
    defp handle_file({:error, reason}), do: {:error, reason}
end
