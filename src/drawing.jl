struct ContextualColor{C}
    neutral_color::C
    hot_color::C
    active_color::C
end

get_color(user_interaction_state, this_widget, color) = color

function get_color(user_interaction_state, this_widget, color::ContextualColor)
    if this_widget == user_interaction_state.active_widget
        return color.active_color
    elseif this_widget == user_interaction_state.hot_widget
        return color.hot_color
    else
        return color.neutral_color
    end
end

function get_num_printable_characters(text)
    num_printable = 0

    for character in text
        if isprint(character)
            num_printable += 1
        end
    end

    return num_printable
end

function get_intersection_extrema(image, shape)
    i_min_shape, i_max_shape = SD.get_i_extrema(shape)
    i_min_image, i_max_image = SD.get_i_extrema(image)

    j_min_shape, j_max_shape = SD.get_j_extrema(shape)
    j_min_image, j_max_image = SD.get_j_extrema(image)

    i_min = max(i_min_image, i_min_shape)
    j_min = max(j_min_image, j_min_shape)

    i_max = min(i_max_image, i_max_shape)
    j_max = min(j_max_image, j_max_shape)

    return i_min, j_min, i_max, j_max
end

function draw_text_line_in_a_box!(image, bounding_box, text, font, alignment, padding, background_color, border_color, text_color)
    SD.draw!(image, SD.FilledRectangle(bounding_box.position, bounding_box.height, bounding_box.width), background_color)

    SD.draw!(image, bounding_box, border_color)

    i_offset, j_offset = get_alignment_offset(bounding_box.height, bounding_box.width, SD.get_height(font), SD.get_width(font) * get_num_printable_characters(text), alignment, padding)
    SD.draw!(image, SD.TextLine(SD.move(bounding_box.position, i_offset, j_offset), text, font), text_color)

    return nothing
end

function draw_text_line_with_slider_in_a_box!(image, bounding_box, slider_value, text, font, alignment, padding, background_color, border_color, text_color, bar_color)
    SD.draw!(image, SD.FilledRectangle(bounding_box.position, bounding_box.height, bounding_box.width), background_color)

    if slider_value > zero(slider_value)
        SD.draw!(image, SD.FilledRectangle(bounding_box.position, bounding_box.height, slider_value), bar_color)
    end

    SD.draw!(image, bounding_box, border_color)

    i_offset, j_offset = get_alignment_offset(bounding_box.height, bounding_box.width, SD.get_height(font), SD.get_width(font) * get_num_printable_characters(text), alignment, padding)
    SD.draw!(image, SD.TextLine(SD.move(bounding_box.position, i_offset, j_offset), text, font), text_color)

    return nothing
end

function SD.draw!(image::AbstractMatrix, bounding_box::SD.Rectangle, widget_type::AbstractWidgetType, args...; kwargs...)
    if SD.is_outbounds(image, bounding_box)
        return nothing
    end

    i_min, j_min, i_max, j_max = get_intersection_extrema(image, bounding_box)
    @assert i_max >= i_min
    @assert j_max >= j_min

    view_box_image = @view image[i_min : i_max, j_min : j_max]

    view_box_bounding_box = SD.Rectangle(SD.Point(bounding_box.position.i - i_min + one(i_min), bounding_box.position.j - j_min + one(j_min)), bounding_box.height, bounding_box.width)

    draw_widget!(view_box_image, view_box_bounding_box, widget_type, args...; kwargs...)

    return nothing
end

function draw_widget!(image, bounding_box, widget_type::Button, user_interaction_state, this_widget, text, font, alignment, padding, background_color, border_color, text_color)
    draw_text_line_in_a_box!(
        image,
        bounding_box,
        text,
        font,
        alignment,
        padding,
        get_color(user_interaction_state, this_widget, background_color),
        get_color(user_interaction_state, this_widget, border_color),
        get_color(user_interaction_state, this_widget, text_color),
    )
end

function draw_widget!(image, bounding_box, widget_type::Slider, user_interaction_state, this_widget, slider_value, alignment, padding, text, font, background_color, border_color, text_color, bar_color)
    draw_text_line_with_slider_in_a_box!(
        image,
        bounding_box,
        slider_value,
        text,
        font,
        alignment,
        padding,
        get_color(user_interaction_state, this_widget, background_color),
        get_color(user_interaction_state, this_widget, border_color),
        get_color(user_interaction_state, this_widget, text_color),
        get_color(user_interaction_state, this_widget, bar_color),
    )
end

function draw_widget!(image, bounding_box, widget_type::TextBox, user_interaction_state, this_widget, text, alignment, padding, font, background_color, border_color, text_color)
    if get_num_printable_characters(text) * SD.get_width(font) > bounding_box.width
        alignment = RIGHT_IN
    end

    draw_text_line_in_a_box!(
        image,
        bounding_box,
        text,
        font,
        alignment,
        padding,
        get_color(user_interaction_state, this_widget, background_color),
        get_color(user_interaction_state, this_widget, border_color),
        get_color(user_interaction_state, this_widget, text_color),
    )

    if this_widget == user_interaction_state.active_widget
        num_printable_characters = get_num_printable_characters(text)
        _, j_offset = get_alignment_offset(bounding_box.height, bounding_box.width, SD.get_height(font), SD.get_width(font) * num_printable_characters, alignment, padding)
        SD.draw!(image, SD.FilledRectangle(SD.move_j(bounding_box.position, j_offset + num_printable_characters * SD.get_width(font) - one(j_offset)), bounding_box.height, oftype(bounding_box.width, 2)), get_color(user_interaction_state, this_widget, text_color))
    end

    return nothing
end

draw_widget!(image, bounding_box, widget_type::Text, user_interaction_state, this_widget, text, font, alignment, padding, background_color, border_color, text_color) = draw_widget!(image, bounding_box, BUTTON, user_interaction_state, this_widget, text, font, alignment, padding, background_color, border_color, text_color)

function draw_widget!(image, bounding_box, widget_type::CheckBox, user_interaction_state, this_widget, widget_value, alignment, padding, text, font, background_color, border_color, text_color, indicator_color)
    font_width = SD.get_width(font)
    box_width = oftype(font_width, 2) * font_width
    x = box_width ÷ oftype(box_width, 8)
    SD.draw!(image, SD.ThickRectangle(SD.move(bounding_box.position, x, x), oftype(x, 6) * x, oftype(x, 6) * x, x), get_color(user_interaction_state, this_widget, indicator_color))
    if widget_value
        SD.draw!(image, SD.FilledRectangle(SD.move(bounding_box.position, oftype(x, 3) * x, oftype(x, 3) * x), oftype(x, 2) * x, oftype(x, 2) * x), get_color(user_interaction_state, this_widget, indicator_color))
    end

    draw_text_line_in_a_box!(
        image,
        SD.Rectangle(SD.move_j(bounding_box.position, box_width), bounding_box.height, bounding_box.width - box_width),
        text,
        font,
        alignment,
        padding,
        get_color(user_interaction_state, this_widget, background_color),
        get_color(user_interaction_state, this_widget, border_color),
        get_color(user_interaction_state, this_widget, text_color),
    )

    return nothing
end

function draw_widget!(image, bounding_box, widget_type::RadioButton, user_interaction_state, this_widget, widget_value, alignment, padding, text, font, background_color, border_color, text_color, indicator_color)

    font_width = SD.get_width(font)
    indicator_width = oftype(font_width, 2) * font_width
    x = indicator_width ÷ oftype(indicator_width, 8)
    SD.draw!(image, SD.ThickCircle(SD.move(bounding_box.position, x, x), oftype(x, 6) * x, x), get_color(user_interaction_state, this_widget, indicator_color))
    if widget_value
        SD.draw!(image, SD.FilledCircle(SD.move(bounding_box.position, oftype(x, 3) * x, oftype(x, 3) * x), oftype(x, 2) * x), get_color(user_interaction_state, this_widget, indicator_color))
    end

    draw_text_line_in_a_box!(
        image,
        SD.Rectangle(SD.move_j(bounding_box.position, indicator_width), bounding_box.height, bounding_box.width - indicator_width),
        text,
        font,
        alignment,
        padding,
        get_color(user_interaction_state, this_widget, background_color),
        get_color(user_interaction_state, this_widget, border_color),
        get_color(user_interaction_state, this_widget, text_color),
    )

    return nothing
end

function draw_widget!(image, bounding_box, widget_type::DropDown, user_interaction_state, this_widget, widget_value, alignment, padding, text, font, background_color, border_color, text_color, indicator_color)
    font_width = SD.get_width(font)
    indicator_width = oftype(font_width, 2) * font_width
    x = indicator_width ÷ oftype(indicator_width, 8)
    if widget_value
        SD.draw!(image, SD.FilledTriangle(SD.move(bounding_box.position, oftype(x, 2) * x, oftype(x, 4) * x), SD.move(bounding_box.position, oftype(x, 6) * x, oftype(x, 2) * x), SD.move(bounding_box.position, oftype(x, 6) * x, oftype(x, 6) * x)), get_color(user_interaction_state, this_widget, indicator_color))
    else
        SD.draw!(image, SD.FilledTriangle(SD.move(bounding_box.position, oftype(x, 2) * x, oftype(x, 2) * x), SD.move(bounding_box.position, oftype(x, 2) * x, oftype(x, 6) * x), SD.move(bounding_box.position, oftype(x, 6) * x, oftype(x, 4) * x)), get_color(user_interaction_state, this_widget, indicator_color))
    end

    draw_text_line_in_a_box!(
        image,
        SD.Rectangle(SD.move_j(bounding_box.position, indicator_width), bounding_box.height, bounding_box.width - indicator_width),
        text,
        font,
        alignment,
        padding,
        get_color(user_interaction_state, this_widget, background_color),
        get_color(user_interaction_state, this_widget, border_color),
        get_color(user_interaction_state, this_widget, text_color),
    )

    return nothing
end
