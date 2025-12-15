local map = vim.keymap.set
-- Only load these mappings if we detect the VSCode Neovim environment
if vim.g.vscode then
	local vscode = require("vscode")

	-- Helper function to execute a VS Code command directly
	local function action(name)
		return function()
			vscode.action(name)
		end
	end

	-- === TOP PICKERS MAPPINGS (Snacks -> VS Code Quick Open/Search) ===

	-- <leader><space> (Smart Find Files)
	map({ "n", "x" }, "<leader> ", action("workbench.action.quickOpen"), { desc = "VSCode Smart Find Files" })

	-- <leader>ff (Find Files)
	map({ "n", "x" }, "<leader>ff", action("workbench.action.quickOpen"), { desc = "VSCode Find Files" })

	-- <leader>fg (Find Git Files) - VS Code's Quick Open often lists Git files first
	map({ "n", "x" }, "<leader>fg", action("workbench.action.quickOpen"), { desc = "VSCode Find Git Files" })

	-- <leader>fr (Recent)
	map("n", "<leader>fr", action("workbench.action.openRecent"), { desc = "VSCode Recent Files" })

	-- <leader>/ (Grep Text)
	map({ "n", "x" }, "<leader>/", action("workbench.action.findInFiles"), { desc = "VSCode Grep Text" })

	-- === EXPLORER MAPPING ===

	-- <leader>e (File Explorer)
	map("n", "<leader>e", action("workbench.view.explorer"), { desc = "VSCode Toggle Explorer" })

	-- === GIT MAPPINGS ===

	-- <leader>gg (Lazygit) - Use VS Code's Source Control View
	map("n", "<leader>gg", action("workbench.view.scm"), { desc = "VSCode Source Control (Git)" })

	-- <leader>gl (Git Log) - Use common Git History command (often from GitLens)
	map("n", "<leader>gl", action("git.viewHistory"), { desc = "VSCode Git History" })

	-- === LSP KEY MAPPINGS ===

	-- gd (Goto Definition)
	map("n", "gd", action("editor.action.revealDefinition"), { desc = "VSCode Go To Definition" })

	-- gr (References)
	map({ "n", "x" }, "gr", action("editor.action.findAllReferences"), { desc = "VSCode Find References" })

	-- <leader>rn (Rename File)
	map("n", "<leader>rn", function()
		-- The rename action requires entering Insert mode for the text box
		vscode.with_insert(function()
			vscode.action("editor.action.rename")
		end)
	end, { desc = "VSCode Rename Symbol" })
end
