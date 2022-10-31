local status_ok, live_command = pcall(require, "live-command")
if not status_ok then
	return
end

live_command.setup {
  commands = {
    Norm = { cmd = "norm" },
    Reg = {
      cmd = "norm",
      -- This will transform ":5Reg a" into ":norm 5@a"
      args = function(opts)
        return (opts.count == -1 and "" or opts.count) .. "@" .. opts.args
      end,
      range = "",
    },
  },
}

