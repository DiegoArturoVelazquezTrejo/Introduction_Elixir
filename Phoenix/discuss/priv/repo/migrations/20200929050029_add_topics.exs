defmodule Discuss.Repo.Migrations.AddTopics do
  use Ecto.Migration

  # Para crear este archivo para la base de datos, en la terminal escribimos: mix ecto.gen.migration add_topics

  # Instructions to postgre for creating a table in database with column title of type string
  # Posteriormente de haber escrito esto, nos vamos a la terminal y escribimos mix ecto.migrate
  def change do
    create table(:topics) do
      add :title, :string
    end
  end
end
