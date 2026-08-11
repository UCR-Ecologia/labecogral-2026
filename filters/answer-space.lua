local function answer_space_blocks(lines)
  local output = FORMAT:match("html") and "html" or FORMAT
  local blocks = {}

  if output == "html" then
    local html = {}
    table.insert(html, '<div class="answer-space">')
    for _ = 1, lines do
      table.insert(html, '<div class="answer-space-line">&nbsp;</div>')
    end
    table.insert(html, '</div>')
    return { pandoc.RawBlock("html", table.concat(html, "\n")) }
  end

  if output == "latex" then
    local latex = {}
    for i = 1, lines do
      table.insert(latex, "\\noindent\\rule{\\linewidth}{0.4pt}")
      if i < lines then
        table.insert(latex, "\\par\\vspace{1.5\\baselineskip}")
      end
    end
    return { pandoc.RawBlock("latex", table.concat(latex, "\n")) }
  end

  for i = 1, lines do
    table.insert(blocks, pandoc.Para({ pandoc.Str("______________________________") }))
    if i < lines then
      table.insert(blocks, pandoc.Para({ pandoc.Str(" ") }))
    end
  end

  return blocks
end

function Div(el)
  if not el.classes:includes("answer-space") then
    return nil
  end

  local lines = tonumber(el.attributes.lines) or 4
  return answer_space_blocks(lines)
end