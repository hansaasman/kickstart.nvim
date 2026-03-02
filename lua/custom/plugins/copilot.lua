-- Fix Copilot ghost text: free Tab/S-Tab from blink.cmp so copilot.vim can use them
return {
  {
    'saghen/blink.cmp',
    opts = {
      keymap = {
        ['<Tab>'] = { 'fallback' },
        ['<S-Tab>'] = { 'fallback' },
      },
    },
  },
}
