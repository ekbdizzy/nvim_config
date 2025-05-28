return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "github/copilot.vim" },            -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" },         -- for curl, log wrapper
      { "nvim-telescope/telescope.nvim" }, -- Use telescope for help actions
    },
    opts = {
      debug = true, -- Enable debugging
      show_help = true, -- Show help actions
      window = {
        layout = "vertical", -- Changed from "float" to "vertical"
        width = 0.4,         -- Optional: set width (40% of screen)
      },
      auto_follow_cursor = false, -- Don't follow the cursor after getting response
      -- Enable Tab completion in chat window
      mappings = {
        close = {
          normal = "q",
          insert = "<C-c>"
        },
        reset = {
          normal = "<C-l>",
        },
        submit_prompt = {
          normal = "<CR>",
          insert = "<C-CR>", -- Ctrl+Enter to submit in insert mode
        },
      },
      -- Initialize prompts table
      prompts = {
        Commit = {
          prompt = "Write commit message for the change with commitizen convention",
        },
        CommitStaged = {
          prompt = "Write commit message for the change with commitizen convention",
        },
      },
    },
    config = function(_, opts)
      local chat = require("CopilotChat")
      local select = require("CopilotChat.select")
      -- Use unnamed register for the selection
      opts.selection = select.unnamed

      -- Override the git prompts message (now that prompts exists)
      opts.prompts.Commit.selection = select.gitdiff
      opts.prompts.CommitStaged.selection = function(source)
        return select.gitdiff(source, true)
      end

      chat.setup(opts)

      -- Enable Copilot suggestions in chat window
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "copilot-chat",
        callback = function()
          -- Enable Copilot in chat buffer
          vim.b.copilot_enabled = true
          
          -- Set filetype to markdown for better Copilot suggestions
          vim.bo.filetype = "markdown"
          
          -- Fix Esc key to exit insert mode properly
          vim.keymap.set("i", "<Esc>", "<Esc>", { noremap = true, silent = true, buffer = true })
          
          -- Map Tab to accept Copilot suggestions in chat window
          vim.keymap.set("i", "<Tab>", function()
            local suggestion = vim.fn['copilot#Accept']()
            if suggestion ~= "" then
              return suggestion
            else
              return "<Tab>"
            end
          end, { expr = true, silent = true, buffer = true })
          
          -- Alternative mappings for Copilot in chat
          vim.keymap.set("i", "<C-J>", 'copilot#Accept("<CR>")', { expr = true, silent = true, buffer = true })
          vim.keymap.set("i", "<C-]>", "<Plug>(copilot-next)", { silent = true, buffer = true })
          vim.keymap.set("i", "<C-[>", "<Plug>(copilot-previous)", { silent = true, buffer = true })
          
          -- Alternative ways to exit insert mode if Esc still doesn't work
          vim.keymap.set("i", "<C-c>", "<Esc>", { noremap = true, silent = true, buffer = true })
        end,
      })

      vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
        chat.ask(args.args, { selection = select.visual })
      end, { nargs = "*", range = true })

      -- Inline chat with Copilot
      vim.api.nvim_create_user_command("CopilotChatInline", function(args)
        chat.ask(args.args, {
          selection = select.visual,
          window = {
            layout = "float",
            relative = "cursor",
            width = 1,
            height = 0.4,
            row = 1,
          },
        })
      end, { nargs = "*", range = true })

      -- Restore CopilotChatBuffer
      vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
        chat.ask(args.args, { selection = select.buffer })
      end, { nargs = "*", range = true })
    end,
    event = "VeryLazy",
    keys = {
      -- Show help actions with telescope
      {
        "<leader>cch",
        function()
          local actions = require("CopilotChat.actions")
          require("CopilotChat.integrations.telescope").pick(actions.help_actions())
        end,
        desc = "CopilotChat - Help actions",
      },
      -- Show prompts actions with telescope
      {
        "<leader>ccp",
        function()
          local actions = require("CopilotChat.actions")
          require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
        end,
        desc = "CopilotChat - Prompt actions",
      },
      -- Code related commands
      { "<leader>cce", "<cmd>CopilotChatExplain<cr>",       desc = "CopilotChat - Explain code" },
      { "<leader>cct", "<cmd>CopilotChatTests<cr>",         desc = "CopilotChat - Generate tests" },
      { "<leader>ccr", "<cmd>CopilotChatReview<cr>",        desc = "CopilotChat - Review code" },
      { "<leader>ccR", "<cmd>CopilotChatRefactor<cr>",      desc = "CopilotChat - Refactor code" },
      { "<leader>ccn", "<cmd>CopilotChatBetterNamings<cr>", desc = "CopilotChat - Better Naming" },
      -- Chat with Copilot in visual mode
      {
        "<leader>ccv",
        ":CopilotChatVisual",
        mode = "x",
        desc = "CopilotChat - Open in vertical split",
      },
      {
        "<leader>ccx",
        ":CopilotChatInline<cr>",
        mode = "x",
        desc = "CopilotChat - Inline chat",
      },
      -- Custom input for CopilotChat
      {
        "<leader>cci",
        function()
          local input = vim.fn.input("Ask Copilot: ")
          if input ~= "" then
            vim.cmd("CopilotChat " .. input)
          end
        end,
        desc = "CopilotChat - Ask input",
      },
      -- Generate commit message based on the git diff
      {
        "<leader>ccm",
        "<cmd>CopilotChatCommit<cr>",
        desc = "CopilotChat - Generate commit message for all changes",
      },
      {
        "<leader>ccM",
        "<cmd>CopilotChatCommitStaged<cr>",
        desc = "CopilotChat - Generate commit message for staged changes",
      },
      -- Quick chat with Copilot
      {
        "<leader>ccq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            vim.cmd("CopilotChatBuffer " .. input)
          end
        end,
        desc = "CopilotChat - Quick chat",
      },
      -- Debug
      { "<leader>ccd", "<cmd>CopilotChatDebugInfo<cr>",     desc = "CopilotChat - Debug Info" },
      -- Fix the issue with diagnostic
      { "<leader>ccf", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "CopilotChat - Fix Diagnostic" },
      -- Clear buffer and chat history
      { "<leader>ccl", "<cmd>CopilotChatReset<cr>",         desc = "CopilotChat - Clear buffer and chat history" },
      -- Toggle Copilot Chat Vsplit
      { "<leader>ccv", "<cmd>CopilotChatToggle<cr>",        desc = "CopilotChat - Toggle Vsplit" },
    },
  },
}
