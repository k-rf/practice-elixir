defmodule Lesson do
  @moduledoc """
  Documentation for `Lesson`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Lesson.hello()
      :world

  """
  def hello do
    :world
  end

  def wait_random(n) do
    wait_time = :rand.uniform(n)
    :timer.sleep(wait_time)
    wait_time
  end

  def wait_random_multi(max_ms, times) do
    Enum.map(1..times, fn _ -> Lesson.wait_random(max_ms) end)
  end

  def wait_random_task(n) do
    task = Task.async(Lesson, :wait_random, [n])
    Task.await(task)
  end

  def wait_random_task_multi(max_ms, times) do
    tasks = Enum.map(1..times, fn _ -> Task.async(Lesson, :wait_random, [max_ms]) end)
    Enum.map(tasks, fn task -> Task.await(task) end)
  end
end
