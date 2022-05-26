import re

from kittens.tui.handler import result_handler
from kitty.boss import Boss
from kitty.conf.utils import python_string
from kitty.key_encoding import KeyEvent, parse_shortcut
from typing import List


def is_window_vim(window, vim_id):
    fp = window.child.foreground_processes
    return any(re.search(vim_id, p['cmdline'][0] if len(p['cmdline']) else '', re.I) for p in fp)


def encode_key_mapping(window, key_mapping):
    mods, key = parse_shortcut(key_mapping)
    event = KeyEvent(
        mods=mods,
        key=key,
        shift=bool(mods & 1),
        alt=bool(mods & 2),
        ctrl=bool(mods & 4),
        super=bool(mods & 8),
        hyper=bool(mods & 16),
        meta=bool(mods & 32),
    ).as_window_system_event()

    return window.encoded_key(event)


def main():
    pass


@result_handler(no_ui=True)
def handle_result(args: List[str], answer: str, target_window_id: int, boss: Boss) -> None:
    window = boss.window_id_map.get(target_window_id)
    operation = args[1]
    direction = args[2]
    key_mapping = args[3]
    vim_id = "n?vim"

    if len(args) > 4 and key_mapping != 'send_text':
        vim_id = args[4]

    if window is None:
        return

    if is_window_vim(window, vim_id):
        if len(args) > 4 and key_mapping == 'send_text':
            mode, text = args[4:][-2:]
            window.send_text(mode, python_string(text).encode('utf-8'))
        else:
            encoded = encode_key_mapping(window, key_mapping)
            window.write_to_child(encoded)
    elif operation == 'neighboring_window':
        if boss.active_tab.neighboring_group_id(direction):
            boss.active_tab.neighboring_window(direction)
        else:
            encoded = encode_key_mapping(window, key_mapping)
            window.write_to_child(encoded)
    elif operation == 'resize_window':
        boss.active_tab.resize_window(direction, 1)
