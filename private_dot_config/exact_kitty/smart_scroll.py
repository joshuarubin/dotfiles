from kittens.tui.handler import result_handler
from kitty.boss import Boss
from typing import Iterator, List

import kitty.key_encoding as ke


REPORT_ALL_EVENT_TYPES = 2


def main():
    pass


@result_handler(no_ui=True)
def handle_result(args: List[str], result: str, target_window_id: int, boss: Boss) -> None:
    w = boss.window_id_map.get(target_window_id)
    if w is None:
        return

    if w.screen.is_main_linebuf():
        if args[1] != "scroll_line_down" or w.screen.scrolled_by > 0:
            getattr(w, args[1])()
            return

    mods, key = ke.parse_shortcut(args[2])
    shift, alt, ctrl, super, hyper, meta, caps_lock, num_lock = (
        bool(mods & bit) for bit in (
           ke.SHIFT, ke.ALT, ke.CTRL, ke.SUPER,
           ke.HYPER, ke.META, ke.CAPS_LOCK, ke.NUM_LOCK))

    for action in [ke.EventType.PRESS, ke.EventType.RELEASE]:
        key_event = ke.KeyEvent(
            type=action, mods=mods, key=key,
            shift=shift, alt=alt, ctrl=ctrl, super=super,
            hyper=hyper, meta=meta, caps_lock=caps_lock, num_lock=num_lock)

        window_system_event = key_event.as_window_system_event()
        sequence = w.encoded_key(window_system_event)
        w.write_to_child(sequence)
