defmodule Wabanex.IMC do

    def calculate(filename) do
        File.read(filename)
        |> handle_file()
    end

    defp handle_file({:ok, content}), do: content
    defp handle_file({:error, reason}), do: {:error, reason}
end
