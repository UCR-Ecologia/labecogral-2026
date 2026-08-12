local function answer_space_blocks(lines)
  local output = FORMAT:match("html") and "html" or FORMAT
  local blocks = {}

  if output == "html" then
    local html = {}
    table.insert(html, '<div class="answer-space">')
    for _ = 1, lines do
      table.insert(html, '<div class="answer-space-line" style="height: 1.8em;">&nbsp;</div>')
    end
    table.insert(html, '</div>')
    return { pandoc.RawBlock("html", table.concat(html, "\n")) }
  end

  if output == "latex" then
    local latex = {}
    table.insert(latex, string.format("\\vspace*{%s\\baselineskip}", lines * 1.5))
    return { pandoc.RawBlock("latex", table.concat(latex, "\n")) }
  end

  for i = 1, lines do
    table.insert(blocks, pandoc.Para({ pandoc.Str(" ") }))
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