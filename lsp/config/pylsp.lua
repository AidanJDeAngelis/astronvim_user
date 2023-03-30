return {
  settings = {
    pylsp = {
      configurationSources = { "flake8" },
      plugins = {
        flake8 = {
          enabled = true,
          maxComplexity = 15,
          maxLineLength = 99,
        },
        jedi_completion = {
          include_class_objects = true,
          include_function_objects = true,
          fuzzy = true,
        },
        mccabe = {
          enabled = false,
        },
        pycodestyle = {
          enabled = false,
        },
        pyflakes = {
          enabled = false,
        },
        rope_completion = {
          enabled = true,
        },
        rope_autoimport = {
          enabled = true,
        },
        yapf = {
          enabled = false,
        },
      },
    },
  },
}
