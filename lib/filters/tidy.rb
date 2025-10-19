
# frozen_string_literal: true

# customized nanoc-external filter

class TidyFilter < Nanoc::Filter
  require "tty-command"
  identifier :tidy
  type :text

  def run(content, params = {})
    cmd = "tidy"
    args = %w(--quiet yes --indent auto --indent-with-tabs --wrap 150 --drop-empty-elements no --tidy-mark no)

    command = TTY::Command.new(printer: :null)
    result = command.run!(cmd, *args, input: content)

    # 0 => success, 1 => warnings, 2 => errors
    if not [0, 1].member?(result.exit_status)
      raise TTY::Command::ExitError.new(cmd, result)
    end

    print result.err
    return result.out.chomp
  end
end
