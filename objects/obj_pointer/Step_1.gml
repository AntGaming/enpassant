m_x = clamp(window_mouse_get_x(), 0, window_get_width())
m_y=clamp(window_mouse_get_y(), 0, window_get_height())
display_mouse_set(m_x, m_y)
