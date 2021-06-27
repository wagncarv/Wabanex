defmodule Wabanex.UserTest do
    use Wabanex.DataCase, async: true

    alias Wabanex.User

    describe "changeset/1" do
        test "When all params are valid, returns a valid changeset" do
            params = %{name: "Mcleod", email: "mcleod@mail.com", password: "123456"}

            response = User.changeset(params)
            assert  %Ecto.Changeset{valid?: true, changes: %{name: "Mcleod", email: "mcleod@mail.com", password: "123456"}, errors: []}
            = response
        end

        test "When there are invalid params, returns an invalid changeset" do
            params = %{name: "M", email: "mcleod@mail.com"}

            response = User.changeset(params)
            assert errors_on(response) == %{name: ["should be at least 2 character(s)"], password: ["can't be blank"]}
        end
    end

end
