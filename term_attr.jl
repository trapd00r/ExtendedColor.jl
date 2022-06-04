#!/usr/bin/julia
using ExtendedColor
using Printf

# displays some term attributes on screen, using the package ExtendedColor
# having fun learning Julia

comment_color = 137

# define a function in terse syntax
# this ended up like an alias
say() = println()


# display the defined terminal colors
#  term_color(0, 15) for the ansi colors
#  term_color(16, 255) for the extended ones
function term_color(index_first::Int, index_last::Int)
  if(index_first === 0)
    for x in (index_first:index_last)
      x = bg(x, ' ')
      print(x)
    end
  else
    for x in (Base.reverse(index_first:index_last))
      x = bg(x, ' ')
      print(x)
    end
  end
end

# send in a named tuple for the arguments so we can make some arguments optional
function hr(args)
  hr = @sprintf("%s\n",
    fg(args.color,
      string(
        # nested ternarys work!
        args.location == "up" ? "╒" : args.location == "none" ? " " : "╘",
        args.char ^ 38,
        args.location == "up" ? "╕" : args.location == "none" ? " " : "╛",
      )
    ),
  )

  if(args.output !== 0) # print to screen
    print(hr)
  else
    return hr
  end
end

hr((
  char     = "═",
  color    = comment_color,
  location = "up",
  output   = 1,
))

@printf(" %s\n", "normal")
@printf(" %s\n", bold("bold"))
@printf(" %s\n", italic(bold("bolditalic")))
@printf(" %s\n", italic("italic"))
@printf(" %s\n", underline("underline"))
@printf(" %s\n", "blink")

## reverse is a method in Base, so use fully qualified name here
@printf(" %s\n", ExtendedColor.reverse("reverse"))

println(" https://nounderlineonlinks.se")

hr((
  char     = "-",
  color    = comment_color,
  location = "none",
  output   = 1,
))

# display the ansi colors
term_color(0, 15)

# display the greyscale ramp
# semicolon for separation of statements
term_color(233,255); say()

hr((
  char     = "-",
  color    = 240,
  location = "none",
  output   = 1,
))


# we can use unicode for identifiers!
# unicode => color index mapping
unicode = (
  🌎 = 37,
  ✭  = 220,
  ✔  = 35,
  💙 = 196,
)

print(@sprintf("%s", ' ' ^ 14),
  string(
    ' ', fg(unicode.🌎, '🌎'),
    ' ', fg(unicode.✭, '✭'),
    ' ', fg(unicode.✔, '✔'),
    ' ', fg(unicode.💙, '💙'),
  )
); say()


hr((
  char     = "═",
  color    = comment_color,
  location = "down",
  output   = 1,
))




# [0]: https://github.com/trapd00r/utils/blob/master/term_attr
# [1]: https://github.com/trapd00r/Term-ExtendedColor

## first version
#function hr(char::Char, color::Int, location::String)::String
#  return @sprintf("%s\n",
#    fg(color,
#      string(
#        location == "up" ? "╒" : "╘",
#        char ^ 38,
#        location == "up" ? "╕" : "╛"
#      )
#    ),
#  )
#end
