defmodule Wabanex.Trainings.Create do
    alias Wabanex.{Repo, Training}

    def call(params) do
        params
        |> Training.changeset()
        |> Repo.insert()
    end
end

# params = %{
#     start_date: "2021-06-22",
#     end_date: "2021-07-22",
#     exercises: [
#         %{
#             name: "Triceps banco",
#             youtube_video_url: "www.google.com",
#             protocol_description: "regular",
#             repetitions: "3x12"
#         },

#         %{
#             name: "Triceps corda",
#             youtube_video_url: "www.google.com",
#             protocol_description: "regular",
#             repetitions: "3x12"
#         }
#     ],

#     user_id: "e5d35270-ee6b-4e78-9bde-29c3eb1441d8"

# }
