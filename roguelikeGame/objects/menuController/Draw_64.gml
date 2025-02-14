if (global.show_money) {
    draw_set_font(fnt_money_display); // Set the custom font
    draw_set_halign(fa_right);
    draw_set_valign(fa_top);
    draw_set_color(c_yellow);
    draw_text(display_get_width() -60, 75, "$" + string(global.money));
}