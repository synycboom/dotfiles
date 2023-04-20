local status_ok, leap = pcall(require, "leap")
if not status_ok then
	return
end

leap.opts.max_phase_one_targets = 0
leap.add_default_mappings()
