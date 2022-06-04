module ExtendedColor

export fg, bg, bold, italic, underline, blink, reverse, reset

function fg(index::Integer, str)
  return string("\033[38;5;", index, "m", str, "\033[m")
end

function bg(index::Integer, str)
  return string("\033[48;5;", index, "m", str, "\033[m")
end

function bold(str)
  return string("\033[1m", str, "\033[m")
end

function italic(str)
  return string("\033[3m", str, "\033[m")
end

function underline(str)
  return string("\033[4m", str, "\033[m")
end

function blink(str)
  return string("\033[5m", str, "\033[m")
end

function reverse(str)
  return string("\033[7m", str, "\033[m")
end

function reset()
  return "\033[m"
end

end # module
