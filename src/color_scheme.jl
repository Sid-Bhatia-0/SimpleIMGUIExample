@enum Colorable begin
    COLOR_BACKGROUND = 1

    # Button
    COLOR_NEUTRAL_BUTTON_BACKGROUND
    COLOR_NEUTRAL_BUTTON_BORDER
    COLOR_NEUTRAL_BUTTON_TEXT

    COLOR_HOT_BUTTON_BACKGROUND
    COLOR_HOT_BUTTON_BORDER
    COLOR_HOT_BUTTON_TEXT

    COLOR_ACTIVE_BUTTON_BACKGROUND
    COLOR_ACTIVE_BUTTON_BORDER
    COLOR_ACTIVE_BUTTON_TEXT

    # Slider
    COLOR_NEUTRAL_SLIDER_BACKGROUND
    COLOR_NEUTRAL_SLIDER_BORDER
    COLOR_NEUTRAL_SLIDER_TEXT
    COLOR_NEUTRAL_SLIDER_BAR

    COLOR_HOT_SLIDER_BACKGROUND
    COLOR_HOT_SLIDER_BORDER
    COLOR_HOT_SLIDER_TEXT
    COLOR_HOT_SLIDER_BAR

    COLOR_ACTIVE_SLIDER_BACKGROUND
    COLOR_ACTIVE_SLIDER_BORDER
    COLOR_ACTIVE_SLIDER_TEXT
    COLOR_ACTIVE_SLIDER_BAR

    # TextBox
    COLOR_NEUTRAL_TEXT_BOX_BACKGROUND
    COLOR_NEUTRAL_TEXT_BOX_BORDER
    COLOR_NEUTRAL_TEXT_BOX_TEXT

    COLOR_HOT_TEXT_BOX_BACKGROUND
    COLOR_HOT_TEXT_BOX_BORDER
    COLOR_HOT_TEXT_BOX_TEXT

    COLOR_ACTIVE_TEXT_BOX_BACKGROUND
    COLOR_ACTIVE_TEXT_BOX_BORDER
    COLOR_ACTIVE_TEXT_BOX_TEXT

    # Text
    COLOR_NEUTRAL_TEXT_BACKGROUND
    COLOR_NEUTRAL_TEXT_BORDER
    COLOR_NEUTRAL_TEXT_TEXT

    COLOR_HOT_TEXT_BACKGROUND
    COLOR_HOT_TEXT_BORDER
    COLOR_HOT_TEXT_TEXT

    COLOR_ACTIVE_TEXT_BACKGROUND
    COLOR_ACTIVE_TEXT_BORDER
    COLOR_ACTIVE_TEXT_TEXT

    # CheckBox
    COLOR_NEUTRAL_CHECK_BOX_BACKGROUND
    COLOR_NEUTRAL_CHECK_BOX_BORDER
    COLOR_NEUTRAL_CHECK_BOX_TEXT
    COLOR_NEUTRAL_CHECK_BOX_BOX

    COLOR_HOT_CHECK_BOX_BACKGROUND
    COLOR_HOT_CHECK_BOX_BORDER
    COLOR_HOT_CHECK_BOX_TEXT
    COLOR_HOT_CHECK_BOX_BOX

    COLOR_ACTIVE_CHECK_BOX_BACKGROUND
    COLOR_ACTIVE_CHECK_BOX_BORDER
    COLOR_ACTIVE_CHECK_BOX_TEXT
    COLOR_ACTIVE_CHECK_BOX_BOX
end

const COLORS = zeros(UInt32, length(instances(Colorable)))

COLORS[Integer(COLOR_BACKGROUND)] = 0x00cccccc

# Button
COLORS[Integer(COLOR_NEUTRAL_BUTTON_BACKGROUND)] = 0x00b0b0b0
COLORS[Integer(COLOR_NEUTRAL_BUTTON_BORDER)] = 0x00000000
COLORS[Integer(COLOR_NEUTRAL_BUTTON_TEXT)] = 0x00000000

COLORS[Integer(COLOR_HOT_BUTTON_BACKGROUND)] = 0x00b0b0b0
COLORS[Integer(COLOR_HOT_BUTTON_BORDER)] = 0x00000000
COLORS[Integer(COLOR_HOT_BUTTON_TEXT)] = 0x00000000

COLORS[Integer(COLOR_ACTIVE_BUTTON_BACKGROUND)] = 0x00b0b0b0
COLORS[Integer(COLOR_ACTIVE_BUTTON_BORDER)] = 0x00000000
COLORS[Integer(COLOR_ACTIVE_BUTTON_TEXT)] = 0x00000000

# Slider
COLORS[Integer(COLOR_NEUTRAL_SLIDER_BACKGROUND)] = 0x00b0b0b0
COLORS[Integer(COLOR_NEUTRAL_SLIDER_BORDER)] = 0x00000000
COLORS[Integer(COLOR_NEUTRAL_SLIDER_TEXT)] = 0x00000000
COLORS[Integer(COLOR_NEUTRAL_SLIDER_BAR)] = 0x00909090

COLORS[Integer(COLOR_HOT_SLIDER_BACKGROUND)] = 0x00b0b0b0
COLORS[Integer(COLOR_HOT_SLIDER_BORDER)] = 0x00000000
COLORS[Integer(COLOR_HOT_SLIDER_TEXT)] = 0x00000000
COLORS[Integer(COLOR_HOT_SLIDER_BAR)] = 0x00909090

COLORS[Integer(COLOR_ACTIVE_SLIDER_BACKGROUND)] = 0x00b0b0b0
COLORS[Integer(COLOR_ACTIVE_SLIDER_BORDER)] = 0x00000000
COLORS[Integer(COLOR_ACTIVE_SLIDER_TEXT)] = 0x00000000
COLORS[Integer(COLOR_ACTIVE_SLIDER_BAR)] = 0x00909090

# TextBox
COLORS[Integer(COLOR_NEUTRAL_TEXT_BOX_BACKGROUND)] = 0x00ffffff
COLORS[Integer(COLOR_NEUTRAL_TEXT_BOX_BORDER)] = 0x00000000
COLORS[Integer(COLOR_NEUTRAL_TEXT_BOX_TEXT)] = 0x00000000

COLORS[Integer(COLOR_HOT_TEXT_BOX_BACKGROUND)] = 0x00ffffff
COLORS[Integer(COLOR_HOT_TEXT_BOX_BORDER)] = 0x00000000
COLORS[Integer(COLOR_HOT_TEXT_BOX_TEXT)] = 0x00000000

COLORS[Integer(COLOR_ACTIVE_TEXT_BOX_BACKGROUND)] = 0x00ffffff
COLORS[Integer(COLOR_ACTIVE_TEXT_BOX_BORDER)] = 0x00000000
COLORS[Integer(COLOR_ACTIVE_TEXT_BOX_TEXT)] = 0x00000000

# Text
COLORS[Integer(COLOR_NEUTRAL_TEXT_BACKGROUND)] = COLORS[Integer(COLOR_BACKGROUND)]
COLORS[Integer(COLOR_NEUTRAL_TEXT_BORDER)] = COLORS[Integer(COLOR_BACKGROUND)]
COLORS[Integer(COLOR_NEUTRAL_TEXT_TEXT)] = 0x00000000

COLORS[Integer(COLOR_HOT_TEXT_BACKGROUND)] = COLORS[Integer(COLOR_BACKGROUND)]
COLORS[Integer(COLOR_HOT_TEXT_BORDER)] = COLORS[Integer(COLOR_BACKGROUND)]
COLORS[Integer(COLOR_HOT_TEXT_TEXT)] = 0x00000000

COLORS[Integer(COLOR_ACTIVE_TEXT_BACKGROUND)] = COLORS[Integer(COLOR_BACKGROUND)]
COLORS[Integer(COLOR_ACTIVE_TEXT_BORDER)] = COLORS[Integer(COLOR_BACKGROUND)]
COLORS[Integer(COLOR_ACTIVE_TEXT_TEXT)] = 0x00000000

# CheckBox
COLORS[Integer(COLOR_NEUTRAL_CHECK_BOX_BACKGROUND)] = 0x00b0b0b0
COLORS[Integer(COLOR_NEUTRAL_CHECK_BOX_BORDER)] = 0x00000000
COLORS[Integer(COLOR_NEUTRAL_CHECK_BOX_TEXT)] = 0x00000000
COLORS[Integer(COLOR_NEUTRAL_CHECK_BOX_BOX)] = 0x00000000

COLORS[Integer(COLOR_HOT_CHECK_BOX_BACKGROUND)] = 0x00b0b0b0
COLORS[Integer(COLOR_HOT_CHECK_BOX_BORDER)] = 0x00000000
COLORS[Integer(COLOR_HOT_CHECK_BOX_TEXT)] = 0x00000000
COLORS[Integer(COLOR_HOT_CHECK_BOX_BOX)] = 0x00000000

COLORS[Integer(COLOR_ACTIVE_CHECK_BOX_BACKGROUND)] = 0x00b0b0b0
COLORS[Integer(COLOR_ACTIVE_CHECK_BOX_BORDER)] = 0x00000000
COLORS[Integer(COLOR_ACTIVE_CHECK_BOX_TEXT)] = 0x00000000
COLORS[Integer(COLOR_ACTIVE_CHECK_BOX_BOX)] = 0x00000000
